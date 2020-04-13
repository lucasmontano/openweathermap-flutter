part of swagger.api;

class WeatherGetResponseCloud {
  
  num all = null;
  
  WeatherGetResponseCloud();

  @override
  String toString() {
    return 'WeatherGetResponseCloud[all=$all, ]';
  }

  WeatherGetResponseCloud.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    all =
        json['all']
    ;
  }


  Map<String, dynamic> toJson() {
    return {
      'all': all
     };
  }

  static List<WeatherGetResponseCloud> listFromJson(List<dynamic> json) {
    return json == null ? new List<WeatherGetResponseCloud>() : json.map((value) => new WeatherGetResponseCloud.fromJson(value)).toList();
  }

  static Map<String, WeatherGetResponseCloud> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeatherGetResponseCloud>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WeatherGetResponseCloud.fromJson(value));
    }
    return map;
  }
}

