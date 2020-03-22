import 'package:lottie/lottie.dart';

class AppAnimation {
  static final Map<String, LottieBuilder> lottie = {
    "atmosphere_day": Lottie.asset("assets/weather/atmosphere.json"),
    "atmosphere_night": Lottie.asset("assets/weather/atmosphere.json"),
    "clear_day": Lottie.asset("assets/weather/clear_day.json"),
    "clear_night": Lottie.asset("assets/weather/clear_night.json"),
    "clouds_day": Lottie.asset("assets/weather/clouds_day.json"),
    "clouds_night": Lottie.asset("assets/weather/clouds_night.json"),
    "drizzle_day": Lottie.asset("assets/weather/drizzle_day.json"),
    "thunderstorm_day": Lottie.asset("assets/weather/rain_thunderstorm.json"),
    "thunderstorm_night": Lottie.asset("assets/weather/rain_thunderstorm.json"),
    "rain_day": Lottie.asset("assets/weather/rain_thunderstorm.json"),
    "rain_night": Lottie.asset("assets/weather/rain_thunderstorm.json"),
    "snow_day": Lottie.asset("assets/weather/snow_day.json"),
    "snow_night": Lottie.asset("assets/weather/snow_night.json"),
  };
}
