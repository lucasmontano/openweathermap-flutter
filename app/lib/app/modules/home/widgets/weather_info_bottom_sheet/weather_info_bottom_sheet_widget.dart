import 'package:app_client/app/modules/home/widgets/weather_info_bottom_sheet/weather_info_bottom_sheet_controller.dart';
import 'package:app_client/swagger/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../home_controller.dart';
import '../../home_module.dart';

class WeatherInfoBottomSheetWidget extends StatefulWidget {
  final WeatherGetResponse weatherGetResponse;
  WeatherInfoBottomSheetWidget(this.weatherGetResponse);

  @override
  _WeatherInfoBottomSheetWidgetState createState() =>
      _WeatherInfoBottomSheetWidgetState();
}

class _WeatherInfoBottomSheetWidgetState
    extends State<WeatherInfoBottomSheetWidget> {
  HomeController controller = HomeModule.to.get();
  WeatherInfoBottomSheetController bottomSheetController = WeatherInfoBottomSheetController();
  @override
  void initState() {
    super.initState();
    controller.isForRemove = false;
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        bottomSheetController.getForecastResponse(
          widget.weatherGetResponse.coord.lat,
          widget.weatherGetResponse.coord.lon,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: controller.isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
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
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.weatherGetResponse.name,
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
                          'M ${widget.weatherGetResponse.main.tempMax.round()}° / L ${widget.weatherGetResponse.main.tempMin.round()}°',
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
                          '${widget.weatherGetResponse.main.temp.round()}°',
                          style: TextStyle(
                            color:
                                controller.isDark ? Colors.white : Colors.black,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.weatherGetResponse.weather[0].description,
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
                                '${widget.weatherGetResponse.main.humidity}%',
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
                        'assets/animations/${widget.weatherGetResponse.weather[0].icon}.json',
                        fit: BoxFit.contain,
                        animate: true),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 45, 16, 20),
                child: Text(
                  'Right now is ${widget.weatherGetResponse.main.temp.round()}°C and feels like ${widget.weatherGetResponse.main.feelsLike.round()}°C\noutside. The wind is blowing arround ${widget.weatherGetResponse.wind.speed}km/\nh and the pressures is ${widget.weatherGetResponse.main.pressure}hPa',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      color: controller.isDark ? Colors.white : Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 5),
                alignment: Alignment.centerLeft,
                child: Text("Tomorrow",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: controller.isDark ? Colors.white : Colors.black)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 10),
                height: 340,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildDayOfWeek(index);
                  },
                ),
              ),
              GestureDetector(onTap: () {
                controller.setIsForRemove(!controller.isForRemove);
                controller.isExploring
                    ? controller.onBookmarked(widget.weatherGetResponse)
                    : controller.onRemoveBookmark(
                        widget.weatherGetResponse.id.toString());
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
        ),
      );
    });
  }

  Widget _buildDayOfWeek(int index) {
    return Observer(builder: (_) {
      return bottomSheetController.forecastGetResponse == null
          ? Center()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        bottomSheetController
                            .forecastGetResponse.list[index].dtTxt
                            .substring(10, 18),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: controller.isDark ? Colors.white : Colors.black),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Lottie.asset(
                            'assets/animations/${bottomSheetController.forecastGetResponse.list[index].weather[0].icon}.json',
                            fit: BoxFit.contain,
                            animate: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "${bottomSheetController.forecastGetResponse.list[index].main.tempMax.round().toString()}°",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: controller.isDark ? Colors.white : Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                    "${bottomSheetController.forecastGetResponse.list[index].main.tempMin.round().toString()}°",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Text(
                    "${bottomSheetController.forecastGetResponse.list[index].weather[0].description}",
                    style: TextStyle(fontSize: 16, color: controller.isDark ? Colors.white : Colors.black),
                  ),
                ),
              ],
            );
    });
  }
}
