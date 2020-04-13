part of swagger.api;

class WeatherGetResponseWeather {
  num id = null;

  String main = null;

  String description = null;

  String icon = null;

  WeatherGetResponseWeather();

  @override
  String toString() {
    return 'WeatherGetResponseWeather[id=$id, main=$main, description=$description, icon=$icon, ]';
  }

  WeatherGetResponseWeather.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }

  static List<WeatherGetResponseWeather> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<WeatherGetResponseWeather>()
        : json
            .map((value) => new WeatherGetResponseWeather.fromJson(value))
            .toList();
  }

  static Map<String, WeatherGetResponseWeather> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseWeather>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new WeatherGetResponseWeather.fromJson(value));
    }
    return map;
  }
}
