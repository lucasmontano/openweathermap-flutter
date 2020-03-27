import 'dart:async';
import 'dart:io';
import 'package:app_client/app/modules/home/widgets/weather_info_bottom_sheet/weather_info_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  Completer<GoogleMapController> _completer = Completer();
  GoogleMapController _googleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    final devicePixelRatio =
        Platform.isAndroid ? MediaQuery.of(context).devicePixelRatio : 1.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: Observer(builder: (_) {
            return GoogleMap(
              onCameraMove: (CameraPosition cameraPosition) async {
                LatLng latLng = await _googleMapController.getLatLng(
                  ScreenCoordinate(
                    x: (context.size.width * devicePixelRatio) ~/ 2.0,
                    y: (context.size.height * devicePixelRatio) ~/ 2.0,
                  ),
                );
                controller.setLatLng(latLng);
              },
              onCameraIdle: () async {
                if (controller.latLng == null) {
                  return;
                }
                await controller.getWeatherInfo();
                controller.markers.length >= 1
                    ? controller.markers.removeAt(0)
                    : null;

                controller.addMarkes(
                  controller.latLng.longitude.toString(),
                  controller.latLng,
                  WeatherInfoBottomSheetWidget(controller.weatherModel),
                );
              },
              markers: Set.from(controller.markers),
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) async {
                _completer.complete(controller);
                _googleMapController = controller;
              },
            );
          })),
          Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
