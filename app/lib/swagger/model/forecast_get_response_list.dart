part of swagger.api;

class ForecastGetResponseList {
  int dt = null;

  WeatherGetResponseMain main = null;

  List<ForecastGetResponseWeather> weather = [];

  WeatherGetResponseCloud clouds = null;

  WeatherGetResponseWind wind = null;

  Object rain = null;

  ForecastGetResponseSys sys = null;

  String dtTxt = null;

  ForecastGetResponseList();

  @override
  String toString() {
    return 'ForecastGetResponseList[dt=$dt, main=$main, weather=$weather, clouds=$clouds, wind=$wind, rain=$rain, sys=$sys, dtTxt=$dtTxt, ]';
  }

  ForecastGetResponseList.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    dt = json['dt'];
    main = new WeatherGetResponseMain.fromJson(json['main']);
    weather = ForecastGetResponseWeather.listFromJson(json['weather']);
    clouds = new WeatherGetResponseCloud.fromJson(json['clouds']);
    wind = new WeatherGetResponseWind.fromJson(json['wind']);
    rain = {};
    ;
    sys = new ForecastGetResponseSys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'main': main,
      'weather': weather,
      'clouds': clouds,
      'wind': wind,
      'rain': rain,
      'sys': sys,
      'dt_txt': dtTxt
    };
  }

  static List<ForecastGetResponseList> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<ForecastGetResponseList>()
        : json
            .map((value) => new ForecastGetResponseList.fromJson(value))
            .toList();
  }

  static Map<String, ForecastGetResponseList> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponseList>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ForecastGetResponseList.fromJson(value));
    }
    return map;
  }
}
