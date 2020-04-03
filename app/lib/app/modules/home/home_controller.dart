import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:app_client/app/modules/shared/repositories/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_client/app/modules/shared/widgets/popup_info_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../app_module.dart';

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

  @action
  setLatLng(LatLng _latLng) => latLng = _latLng;

  @action
  addMarkes(String _markerId, LatLng _latLng, BuildContext context) {
    markers.add(
      Marker(
        markerId: MarkerId(_markerId),
        draggable: false,
        position: _latLng,
        visible: true,
        infoWindow: InfoWindow(
          title: weatherModel.name,
          snippet: weatherModel.weather[0].description,
           onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PopupInfoWidget(weatherModel: weatherModel);
              },
            );
          },
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
