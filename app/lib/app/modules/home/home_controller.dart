import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import '../../../main.dart';
import '../shared/models/weather_get_response_model.dart';
import '../shared/repositories/weather_repository.dart';
import 'widgets/weather_info_bottom_sheet/weather_info_bottom_sheet_widget.dart';

part 'home_controller.g.dart';

///HomeController
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  WeatherRepository weatherRepository;
  Dio dio = Dio();
  _HomeControllerBase() {
    List response = sharedPreferences.getStringList("savedBookmark");
    if (response != null && response.isNotEmpty) {
      for (var json in response) {
        final weatherGetResponse = WeatherGetResponse.fromJsonString(json);
        weatherGetResponseList.add(weatherGetResponse);
      }
    }
    autorun((_) {
      if (weatherGetResponseList.length !=
          sharedPreferences.getStringList("savedBookmark")?.length) {
        sharedPreferences.setStringList(
            "savedBookmark",
            weatherGetResponseList
                .map((model) => model.toJsonString())
                .toList());
      }
    });

    reaction((_) => isDark, _setThemeMap);
    when((_) => googleMapController != null, _checkTheme);
  }

  void _setThemeMap(isDark) async {
    var mapStyle = isDark ? await getDarkStyle() : "[]";
    googleMapController.setMapStyle(mapStyle);
  }

  @observable
  GoogleMapController googleMapController;

  @action
  setGoogleMapController(GoogleMapController controller) =>
      googleMapController = controller;

  void _checkTheme() {
    var brightness = MediaQuery.of(context).platformBrightness;
    setIsDark(brightness == Brightness.dark);
  }

  Future<String> getDarkStyle() =>
      rootBundle.loadString('assets/map/dark_map_style.txt');

  @observable
  ObservableList temporaryMarkers = ObservableList.of([]);

  @computed
  ObservableList<Marker> get savedBookmarks => weatherGetResponseList
      .map(
        (weatherGetResponse) {
          return Marker(
            markerId: MarkerId(weatherGetResponse.id.toString()),
            draggable: false,
            position: weatherGetResponse.coord.toLatLng(),
            visible: true,
            infoWindow: InfoWindow(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: true,
                  context: context,
                  builder: (_) =>
                      WeatherInfoBottomSheetWidget(weatherGetResponse),
                );
              },
              title: weatherGetResponse == null ? "" : weatherGetResponse.name,
              snippet: weatherGetResponse == null
                  ? ""
                  : weatherGetResponse.weather[0].description,
            ),
          );
        },
      )
      .toList()
      .asObservable();

  @observable
  ObservableList<WeatherGetResponse> weatherGetResponseList =
      ObservableList.of([]);

  @observable
  bool isDark = false;

  @action
  void setIsDark(bool _value) => isDark = _value;

  @observable
  bool isExploring = true;
  @action
  void setIsExploring(bool _value) => isExploring = _value;

  @observable
  bool isForRemove = false;
  @action
  setIsForRemove(bool _value) => isForRemove = _value;

  @observable
  LatLng latLng;

  @observable
  WeatherGetResponse weatherGetResponse;

  @observable
  BuildContext context;
  @action
  setContext(BuildContext _context) => context = _context;

  @observable
  String address = "";
  @action
  setAddress(String _address) => address = _address;

  @action
  setLatLng(LatLng _latLng) => latLng = _latLng;

  @action
  onAddTemporaryMarkers(String _markerId, LatLng _latLng, Widget _bottomSheet) {
    temporaryMarkers.add(
      Marker(
        markerId: MarkerId(_markerId),
        draggable: false,
        position: _latLng,
        visible: true,
        infoWindow: InfoWindow(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: true,
              context: context,
              builder: (_) => _bottomSheet,
            );
          },
          title: weatherGetResponse == null ? "" : weatherGetResponse.name,
          snippet: weatherGetResponse == null
              ? ""
              : weatherGetResponse.weather[0].description,
        ),
      ),
    );
  }

  @action
  onBookmarked(WeatherGetResponse weatherGetResponse) {
    weatherGetResponseList.add(weatherGetResponse);
  }

  @action
  Future<void> getWeatherResponse() async {
    weatherRepository = WeatherRepository(latLng);
    weatherGetResponse = await weatherRepository.fetchPost(dio);
  }

  @action
  onRemoveBookmark(String _markerId) {
    savedBookmarks
        .removeWhere((marker) => marker.markerId == MarkerId(_markerId));
  }

  searchandNavigate(_) {
    Geolocator().placemarkFromAddress(address).then((result) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
                result[0].position.latitude, result[0].position.longitude),
            zoom: 10.0,
          ),
        ),
      );
    });
  }
}
