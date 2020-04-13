part of swagger.api;

class WeatherGetResponseCoord {
  num lon = null;

  num lat = null;

  WeatherGetResponseCoord();

  @override
  String toString() {
    return 'WeatherGetResponseCoord[lon=$lon, lat=$lat, ]';
  }

  WeatherGetResponseCoord.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    lon = json['lon'];
    lat = json['lat'];
  }

  toLatLng() => LatLng(lat, lon);

  Map<String, dynamic> toJson() {
    return {'lon': lon, 'lat': lat};
  }

  static List<WeatherGetResponseCoord> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<WeatherGetResponseCoord>()
        : json
            .map((value) => new WeatherGetResponseCoord.fromJson(value))
            .toList();
  }

  static Map<String, WeatherGetResponseCoord> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseCoord>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new WeatherGetResponseCoord.fromJson(value));
    }
    return map;
  }
}
