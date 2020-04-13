part of swagger.api;

class WeatherGetResponseSys {
  
  num type = null;
  

  num id = null;
  

  String message = null;
  

  String coutry = null;
  

  num sunrise = null;
  

  num sunset = null;
  
  WeatherGetResponseSys();

  @override
  String toString() {
    return 'WeatherGetResponseSys[type=$type, id=$id, message=$message, coutry=$coutry, sunrise=$sunrise, sunset=$sunset, ]';
  }

  WeatherGetResponseSys.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    type =
        json['type']
    ;
    id =
        json['id']
    ;
    message =
        json['message']
    ;
    coutry =
        json['coutry']
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
      'type': type,
      'id': id,
      'message': message,
      'coutry': coutry,
      'sunrise': sunrise,
      'sunset': sunset
     };
  }

  static List<WeatherGetResponseSys> listFromJson(List<dynamic> json) {
    return json == null ? new List<WeatherGetResponseSys>() : json.map((value) => new WeatherGetResponseSys.fromJson(value)).toList();
  }

  static Map<String, WeatherGetResponseSys> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseSys>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WeatherGetResponseSys.fromJson(value));
    }
    return map;
  }
}

