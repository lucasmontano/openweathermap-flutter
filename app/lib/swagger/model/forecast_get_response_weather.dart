part of swagger.api;

class ForecastGetResponseWeather {
  
  num id = null;
  

  String main = null;
  

  String description = null;
  

  String icon = null;
  
  ForecastGetResponseWeather();

  @override
  String toString() {
    return 'ForecastGetResponseWeather[id=$id, main=$main, description=$description, icon=$icon, ]';
  }

  ForecastGetResponseWeather.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    main =
        json['main']
    ;
    description =
        json['description']
    ;
    icon =
        json['icon']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon
     };
  }

  static List<ForecastGetResponseWeather> listFromJson(List<dynamic> json) {
    return json == null ? new List<ForecastGetResponseWeather>() : json.map((value) => new ForecastGetResponseWeather.fromJson(value)).toList();
  }

  static Map<String, ForecastGetResponseWeather> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponseWeather>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ForecastGetResponseWeather.fromJson(value));
    }
    return map;
  }
}

