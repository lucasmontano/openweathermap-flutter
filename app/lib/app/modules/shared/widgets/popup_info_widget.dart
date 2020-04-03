import 'package:app_client/app/modules/shared/models/weather_model.dart';
import 'package:app_client/app/modules/shared/style/typography.dart';
import 'package:flutter/material.dart';

class PopupInfoWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  final bool isBookmarked;

  PopupInfoWidget({
    this.weatherModel,
    this.isBookmarked = false,
  });
  
  //TODO:  When set switch theme have change ext and detail color.
  final Color _textColor = Color(0xFF302F2B);
  final Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 500,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle(),
              _buildDivider(),
              _buildInfo(weatherModel.main),
              _buildTempWithIcon(weatherModel.main),
              _buildButtonInfo(weatherModel.main),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Text(
        "${weatherModel?.name}",
        style: GlobalTypography.title.copyWith(color: _textColor),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 5,
      width: 200,
      color: _textColor,
    );
  }

  Widget _buildInfo(Main main) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        "M ${main?.tempMax?.round()} º / "
        "L ${main?.tempMin?.round()} º",
        style: TextStyle(color: _textColor),
      ),
    );
  }

  Widget _buildTempWithIcon(Main main) {
    //This image is provide from openweathermap with icon id
    final _urlImage =
        "http://openweathermap.org/img/wn/${weatherModel.weather[0].icon}@2x.png"; 
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTempInfo(main),
          Image.network(_urlImage),
        ],
      ),
    );
  }

  Widget _buildTempInfo(Main main) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${main?.temp?.round()} º",
          style: GlobalTypography.bigTitle.copyWith(color: _textColor),
        ),
        Text(
          "${weatherModel.weather[0].description}",
          style: GlobalTypography.description.copyWith(color: _textColor),
        ),
        SizedBox(height: 30),
        Row(
          children: <Widget>[
            Icon(
              Icons.cloud,
              color: _textColor,
            ),
            SizedBox(width: 10),
            Text(
              "${main.humidity}%",
              style: GlobalTypography.description.copyWith(
                fontSize: 25,
                color: _textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonInfo(Main main) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Right now is ${main.temp.round()} º C and "
            "feels like ${main.feelsLike.round()} ºC outside. "
            "The wind is blowing around ${weatherModel.wind.speed} Km/h "
            "and the pressure is ${main.pressure} hPa.",
            style: TextStyle(color: _textColor),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
              splashColor: Colors.red,
              onPressed: () {
                //TODO: set onPressed for bookmarker here
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              color: Colors.black,
              child: Text(
                isBookmarked
                    ? "Remove this location"
                    : "Bookmarker this location",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
