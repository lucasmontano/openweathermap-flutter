import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:app_client/app/modules/shared/repositories/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  LatLng latLng;

  @observable
  WeatherModel weatherModel;

  @observable
  BuildContext context;
  @action
  setContext(BuildContext _context) => context = _context;

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
  Future getWeatherInfo() async {
    weatherRepository = WeatherRepository(latLng);
    weatherModel = await weatherRepository.fetchPost(dio);
  }
}
