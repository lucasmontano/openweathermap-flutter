import 'package:app/app/modules/home/widgets/custom_button_widget.dart';
import 'package:app/app/shared/themes/app_colors.dart';
import 'package:app/app/shared/themes/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final bool isNight;
  final LottieBuilder weatherMainAnimation;
  final String description;
  final Function actionButton;
  final bool isBookmark;
  final String cityName;
  final String temperature;
  final String weatherMain;
  final String wind;
  final String humidity;

  const WeatherDetailsWidget({
    @required this.isNight,
    @required this.weatherMainAnimation,
    @required this.description,
    @required this.actionButton,
    @required this.isBookmark,
    @required this.cityName,
    @required this.temperature,
    @required this.weatherMain,
    @required this.wind,
    @required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height * 0.1),
        decoration: BoxDecoration(
            color: isNight ? AppColors.backgroundNight : AppColors.backgroundDay,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCityName(),
            _buildTemperature(),
            Expanded(
              child: weatherMainAnimation,
            ),
            _buildDescription(),
            CustomButtomWidget(
              color: isNight
                  ? AppColors.backgroundButtonNight
                  : AppColors.backgroundButtonDay,
              action: actionButton,
              text:
                  isBookmark ? "Remove from bookmarks" : "Bookmark this location",
            ),
            _buildRowWithWindAndHumidity(),
          ],
        ),
      ),
    );
  }

  Widget _buildCityName() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
      ),
      child: Text(
        cityName,
        style: AppTypography.cityName,
      ),
    );
  }

  Widget _buildTemperature() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "$temperature°",
            style: AppTypography.temperature,
          ),
          SizedBox(width: 8),
          Container(
            height: 28,
            width: 2,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            weatherMain,
            style: AppTypography.weatherMain,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        maxLines: 3,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.description,
      ),
    );
  }

  Widget _buildRowWithWindAndHumidity() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  "Wind",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 12,
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  "$wind km/h",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 2,
            color: Color(0xFFefedf4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: <Widget>[
                Text(
                  "Humidity",
                  style: AppTypography.information,
                ),
                SizedBox(width: 8),
                Container(
                  height: 12,
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  "$humidity%",
                  style: AppTypography.information,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
