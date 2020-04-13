part of swagger.api;

class WeatherGetResponse {
  WeatherGetResponseCoord coord;

  List<WeatherGetResponseWeather> weather = [];

  String base;

  WeatherGetResponseMain main;

  WeatherGetResponseWind wind;

  WeatherGetResponseCloud cloud;

  int dt;

  WeatherGetResponseSys sys;

  num timezone;

  num id;

  String name;

  num cod;

  WeatherGetResponse();

  @override
  String toString() {
    return 'WeatherGetResponse[coord=$coord, weather=$weather, base=$base, main=$main, wind=$wind, cloud=$cloud, dt=$dt, sys=$sys, timezone=$timezone, id=$id, name=$name, cod=$cod, ]';
  }

  WeatherGetResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    coord = WeatherGetResponseCoord.fromJson(json['coord']);
    weather = WeatherGetResponseWeather.listFromJson(json['weather']);
    base = json['base'];
    main = WeatherGetResponseMain.fromJson(json['main']);
    wind = WeatherGetResponseWind.fromJson(json['wind']);
    cloud = WeatherGetResponseCloud.fromJson(json['cloud']);
    dt = json['dt'];
    sys = WeatherGetResponseSys.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() {
    return {
      'coord': coord,
      'weather': weather,
      'base': base,
      'main': main,
      'wind': wind,
      'cloud': cloud,
      'dt': dt,
      'sys': sys,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod
    };
  }

  static List<WeatherGetResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<WeatherGetResponse>()
        : json.map((value) => new WeatherGetResponse.fromJson(value)).toList();
  }

  static WeatherGetResponse fromJsonString(String json) {
    if (json == null) return null;
    return WeatherGetResponse.fromJson(jsonDecode(json));
  }

  static Map<String, WeatherGetResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, WeatherGetResponse>{};
    if (json != null && json.length > 0) {
      json.forEach(
          (key, value) => map[key] = WeatherGetResponse.fromJson(value));
    }
    return map;
  }
}
