import 'dart:math';

import 'package:app_client/app/modules/home/home_controller.dart';
import 'package:app_client/app/modules/home/home_module.dart';
import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class WeatherInfoBottomSheetWidget extends StatelessWidget {
  HomeController controller = HomeModule.to.get();
  WeatherModel _weatherModel;
  WeatherInfoBottomSheetWidget(this._weatherModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 4),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
            ),
            child: Text(
              _weatherModel.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'M ${_weatherModel.main.tempMax.round()}° / L ${_weatherModel.main.tempMin.round()}°',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 45, 16, 10),
                    child: Text(
                      '${_weatherModel.main.temp.round()}°',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      _weatherModel.weather[0].description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.ac_unit),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            '${_weatherModel.main.humidity}%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: Lottie.asset(
                    'assets/animations/${_weatherModel.weather[0].icon}.json',
                    fit: BoxFit.contain,
                    animate: true),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 45, 16, 20),
            child: Text(
              'Right now is ${_weatherModel.main.temp.round()}°C and feels like ${_weatherModel.main.feelsLike.round()}°C\noutside. The wind is blowing arround ${_weatherModel.wind.speed}km/\nh and the pressures is ${_weatherModel.main.pressure}hPa',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(onTap: () {
            controller.setIsForRemove(!controller.isForRemove);
            controller.isExploring
                ? controller.saveMarker(
                    _weatherModel.id.toString(),
                    controller.latLng,
                    WeatherInfoBottomSheetWidget(controller.weatherModel),
                  )
                : controller.removeMarkersSave(_weatherModel.id.toString());
          }, child: Observer(builder: (_) {
            return Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 2,
              margin: EdgeInsets.fromLTRB(16, 45, 16, 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                controller.isExploring
                    ? controller.isForRemove
                        ? "Remove From Bookmarks"
                        : 'Bookmark this location'
                    : controller.isForRemove
                        ? 'Remove From Bookmarks'
                        : "Bookmark this location",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
