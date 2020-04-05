import 'dart:convert';
import 'package:app_client/app/modules/home/widgets/weather_info_bottom_sheet/weather_info_bottom_sheet_widget.dart';
import 'package:app_client/app/modules/shared/models/marker_model.dart' as MM;
import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:app_client/app/modules/shared/repositories/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_client/app/modules/shared/extentions/marker_extentions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_client/main.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  WeatherRepository weatherRepository;
  Dio dio = Dio();
  _HomeControllerBase() {
    List<String> response = sharedPreferences.getStringList("saveMarker");
    if (response != null && response.isNotEmpty) {
      response.forEach(
        (json) {
          final model = WeatherModel.fromJsonString(json);
          modelList.add(model);
        },
      );
    }
    autorun((_) {
      if (modelList.length !=
          sharedPreferences.getStringList("saveMarker")?.length) {
        sharedPreferences.setStringList("saveMarker",
            modelList.map((model) => model.toJsonString()).toList());
      }
    });
  }

  @observable
  ObservableList markers = ObservableList.of([]);

  @computed
  ObservableList<Marker> get markersSave => modelList
      .map(
        (model) {
          return Marker(
            markerId: MarkerId(model.id.toString()),
            draggable: false,
            position: model.coord.toLatLng(),
            visible: true,
            infoWindow: InfoWindow(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: true,
                  context: context,
                  builder: (_) => WeatherInfoBottomSheetWidget(model),
                );
              },
              title: model == null ? "" : model.name,
              snippet: model == null ? "" : model.weather[0].description,
            ),
          );
        },
      )
      .toList()
      .asObservable();

  @observable
  ObservableList<WeatherModel> modelList = ObservableList.of([]);

  @observable
  bool isDark = false;
  @action
  setIsDark(bool _value) => isDark = _value;

  @observable
  bool isExploring = true;
  @action
  setIsExploring(bool _value) => isExploring = _value;

  @observable
  bool isForRemove = false;
  @action
  setIsForRemove(bool _value) => isForRemove = _value;

  @observable
  LatLng latLng;

  @observable
  WeatherModel weatherModel;

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
  addMarkes(String _markerId, LatLng _latLng, Widget _bottomSheet) {
    markers.add(
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
          title: weatherModel == null ? "" : weatherModel.name,
          snippet:
              weatherModel == null ? "" : weatherModel.weather[0].description,
        ),
      ),
    );
  }

  @observable
  List<String> markersList = [];

  @action
  saveMarker(WeatherModel weatherModel) {
    modelList.add(weatherModel);
  }

  @action
  Future getWeatherInfo() async {
    weatherRepository = WeatherRepository(latLng);
    weatherModel = await weatherRepository.fetchPost(dio);
  }

  @action
  removeMarkersSave(String _markerId) {
    markersSave.removeWhere((marker) => marker.markerId == MarkerId(_markerId));
    markersList = [];
    markersSave.forEach((element) => markersList.add(element.toJson()));
    sharedPreferences.setStringList("marker", markersList);
  }

  searchandNavigate(GoogleMapController mapController) {
    Geolocator().placemarkFromAddress(address).then((result) {
      mapController.animateCamera(
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
