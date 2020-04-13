part of swagger.api;

class WeatherGetResponseMain {
  
  num temp = null;
  

  num feelsLike = null;
  

  num tempMin = null;
  

  num tempMax = null;
  

  num pressure = null;
  

  num seaLevel = null;
  

  num grndLevel = null;
  

  num humidity = null;
  

  num tempKf = null;
  
  WeatherGetResponseMain();

  @override
  String toString() {
    return 'WeatherGetResponseMain[temp=$temp, feelsLike=$feelsLike, tempMin=$tempMin, tempMax=$tempMax, pressure=$pressure, seaLevel=$seaLevel, grndLevel=$grndLevel, humidity=$humidity, tempKf=$tempKf, ]';
  }

  WeatherGetResponseMain.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    temp =
        json['temp']
    ;
    feelsLike =
        json['feels_like']
    ;
    tempMin =
        json['temp_min']
    ;
    tempMax =
        json['temp_max']
    ;
    pressure =
        json['pressure']
    ;
    seaLevel =
        json['sea_level']
    ;
    grndLevel =
        json['grnd_level']
    ;
    humidity =
        json['humidity']
    ;
    tempKf =
        json['temp_kf']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'humidity': humidity,
      'temp_kf': tempKf
     };
  }

  static List<WeatherGetResponseMain> listFromJson(List<dynamic> json) {
    return json == null ? new List<WeatherGetResponseMain>() : json.map((value) => new WeatherGetResponseMain.fromJson(value)).toList();
  }

  static Map<String, WeatherGetResponseMain> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseMain>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WeatherGetResponseMain.fromJson(value));
    }
    return map;
  }
}

