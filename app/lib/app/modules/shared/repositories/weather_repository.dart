import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/weather_get_response_model.dart';

class WeatherRepository extends Disposable {
  String baseUrl = 'http://api.openweathermap.org/';
  String appId = '&APPID=c6e381d8c7ff98f0fee43775817cf6ad';

  final LatLng _latLng;

  Future<WeatherGetResponse> fetchPost(Dio client) async {
    
    final response = await client.get("$baseUrl/data/2.5/weather?units=metric&lat=${_latLng.latitude}&lon=${_latLng.longitude}$appId");
    return WeatherGetResponse.fromJson(response.data);
  }

  WeatherRepository(this._latLng);
  //dispose will be called automatically
  @override
  void dispose() {}
}
