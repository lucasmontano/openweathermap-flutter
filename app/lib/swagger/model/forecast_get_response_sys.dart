part of swagger.api;

class ForecastGetResponseSys {
  
  String pod = null;
  
  ForecastGetResponseSys();

  @override
  String toString() {
    return 'ForecastGetResponseSys[pod=$pod, ]';
  }

  ForecastGetResponseSys.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    pod =
        json['pod']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'pod': pod
     };
  }

  static List<ForecastGetResponseSys> listFromJson(List<dynamic> json) {
    return json == null ? new List<ForecastGetResponseSys>() : json.map((value) => new ForecastGetResponseSys.fromJson(value)).toList();
  }

  static Map<String, ForecastGetResponseSys> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponseSys>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ForecastGetResponseSys.fromJson(value));
    }
    return map;
  }
}

