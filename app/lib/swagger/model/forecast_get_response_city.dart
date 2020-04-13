part of swagger.api;

class ForecastGetResponseCity {
  
  num id = null;
  

  String name = null;
  

  ForecastGetResponseCityCoord coord = null;
  

  String contry = null;
  

  num timezone = null;
  

  num sunrise = null;
  

  num sunset = null;
  
  ForecastGetResponseCity();

  @override
  String toString() {
    return 'ForecastGetResponseCity[id=$id, name=$name, coord=$coord, contry=$contry, timezone=$timezone, sunrise=$sunrise, sunset=$sunset, ]';
  }

  ForecastGetResponseCity.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    coord =
      
      
      new ForecastGetResponseCityCoord.fromJson(json['coord'])
;
    contry =
        json['contry']
    ;
    timezone =
        json['timezone']
    ;
    sunrise =
        json['sunrise']
    ;
    sunset =
        json['sunset']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coord': coord,
      'contry': contry,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset
     };
  }

  static List<ForecastGetResponseCity> listFromJson(List<dynamic> json) {
    return json == null ? new List<ForecastGetResponseCity>() : json.map((value) => new ForecastGetResponseCity.fromJson(value)).toList();
  }

  static Map<String, ForecastGetResponseCity> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponseCity>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ForecastGetResponseCity.fromJson(value));
    }
    return map;
  }
}

