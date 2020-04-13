part of swagger.api;

class WeatherGetResponseWind {
  
  num speed = null;
  

  num deg = null;
  
  WeatherGetResponseWind();

  @override
  String toString() {
    return 'WeatherGetResponseWind[speed=$speed, deg=$deg, ]';
  }

  WeatherGetResponseWind.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    speed =
        json['speed']
    ;
    deg =
        json['deg']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg
     };
  }

  static List<WeatherGetResponseWind> listFromJson(List<dynamic> json) {
    return json == null ? new List<WeatherGetResponseWind>() : json.map((value) => new WeatherGetResponseWind.fromJson(value)).toList();
  }

  static Map<String, WeatherGetResponseWind> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseWind>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WeatherGetResponseWind.fromJson(value));
    }
    return map;
  }
}

