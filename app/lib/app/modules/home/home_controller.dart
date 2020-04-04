import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:app_client/app/modules/shared/repositories/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  WeatherRepository weatherRepository;
  Dio dio = Dio();

  @observable
  ObservableList markers = ObservableList.of([]);

  @observable
  ObservableList markersSave = ObservableList.of([]);

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

  @action
  saveMarker(String _markerId, LatLng _latLng, Widget _bottomSheet) {
    markersSave.add(
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

  @action
  Future getWeatherInfo() async {
    weatherRepository = WeatherRepository(latLng);
    weatherModel = await weatherRepository.fetchPost(dio);
  }

  @action
  removeMarkersSave(String _markerId) {
    markersSave.removeWhere((marker) => marker.markerId == MarkerId(_markerId));
  }

    searchandNavigate(GoogleMapController mapController) {
    Geolocator().placemarkFromAddress(address).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }
}
