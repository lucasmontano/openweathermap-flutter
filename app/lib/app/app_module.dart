import 'package:app_client/app/modules/shared/repositories/weather_repository.dart';
import 'package:app_client/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_client/app/app_widget.dart';
import 'package:app_client/app/modules/home/home_module.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends MainModule {
  LatLng latLng;
  @override
  List<Bind> get binds => [
        Bind((i) => WeatherRepository(latLng)),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
