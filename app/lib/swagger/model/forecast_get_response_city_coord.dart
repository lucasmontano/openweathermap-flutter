part of swagger.api;

class ForecastGetResponseCityCoord {
  
  num lat = null;
  

  num lon = null;
  
  ForecastGetResponseCityCoord();

  @override
  String toString() {
    return 'ForecastGetResponseCityCoord[lat=$lat, lon=$lon, ]';
  }

  ForecastGetResponseCityCoord.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    lat =
        json['lat']
    ;
    lon =
        json['lon']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon
     };
  }

  static List<ForecastGetResponseCityCoord> listFromJson(List<dynamic> json) {
    return json == null ? new List<ForecastGetResponseCityCoord>() : json.map((value) => new ForecastGetResponseCityCoord.fromJson(value)).toList();
  }

  static Map<String, ForecastGetResponseCityCoord> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponseCityCoord>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ForecastGetResponseCityCoord.fromJson(value));
    }
    return map;
  }
}

