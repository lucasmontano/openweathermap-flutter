import 'dart:math';

import 'package:app_client/app/modules/home/home_controller.dart';
import 'package:app_client/app/modules/home/home_module.dart';
import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class WeatherInfoBottomSheetWidget extends StatefulWidget {
  WeatherModel _weatherModel;
  WeatherInfoBottomSheetWidget(this._weatherModel);

  @override
  _WeatherInfoBottomSheetWidgetState createState() =>
      _WeatherInfoBottomSheetWidgetState();
}

class _WeatherInfoBottomSheetWidgetState
    extends State<WeatherInfoBottomSheetWidget> {
  HomeController controller = HomeModule.to.get();
  @override
  void initState() {
    super.initState();
    controller.isForRemove = false;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: controller.isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 4),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color:
                                controller.isDark ? Colors.white : Colors.black,
                            width: 3)),
                  ),
                  child: Text(
                    widget._weatherModel.name,
                    style: TextStyle(
                      color: controller.isDark ? Colors.white : Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Switch(
                  value: controller.isDark,
                  onChanged: controller.setIsDark,
                  activeColor: Colors.white,
                  hoverColor: Colors.white,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Text(
                        'M ${widget._weatherModel.main.tempMax.round()}° / L ${widget._weatherModel.main.tempMin.round()}°',
                        style: TextStyle(
                          color:
                              controller.isDark ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 45, 16, 10),
                      child: Text(
                        '${widget._weatherModel.main.temp.round()}°',
                        style: TextStyle(
                          color:
                              controller.isDark ? Colors.white : Colors.black,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        widget._weatherModel.weather[0].description,
                        style: TextStyle(
                          color:
                              controller.isDark ? Colors.white : Colors.black,
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
                            child: Icon(
                              Icons.ac_unit,
                              color: controller.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              '${widget._weatherModel.main.humidity}%',
                              style: TextStyle(
                                color: controller.isDark
                                    ? Colors.white
                                    : Colors.black,
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
                      'assets/animations/${widget._weatherModel.weather[0].icon}.json',
                      fit: BoxFit.contain,
                      animate: true),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 45, 16, 20),
              child: Text(
                'Right now is ${widget._weatherModel.main.temp.round()}°C and feels like ${widget._weatherModel.main.feelsLike.round()}°C\noutside. The wind is blowing arround ${widget._weatherModel.wind.speed}km/\nh and the pressures is ${widget._weatherModel.main.pressure}hPa',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    color: controller.isDark ? Colors.white : Colors.black),
              ),
            ),
            GestureDetector(onTap: () {
              controller.setIsForRemove(!controller.isForRemove);
              controller.isExploring
                  ? controller.saveMarker(
                      widget._weatherModel.id.toString(),
                      controller.latLng,
                      WeatherInfoBottomSheetWidget(controller.weatherModel),
                    )
                  : controller
                      .removeMarkersSave(widget._weatherModel.id.toString());
            }, child: Observer(builder: (_) {
              return Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 2,
                margin: EdgeInsets.fromLTRB(16, 45, 16, 20),
                decoration: BoxDecoration(
                  color: controller.isDark ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  controller.isExploring
                      ? controller.isForRemove
                          ? "Remove From Bookmarks"
                          : 'Bookmark this location'
                      : controller.isForRemove
                          ? 'Bookmark this location'
                          : "Remove From Bookmarks",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: controller.isDark ? Colors.black : Colors.white,
                  ),
                ),
              );
            })),
          ],
        ),
      );
    });
  }
}
