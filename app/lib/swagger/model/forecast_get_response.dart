part of swagger.api;

class ForecastGetResponse {
  
  String cod = null;
  

  num message = null;
  

  num cnt = null;
  

  List<ForecastGetResponseList> list = [];
  

  ForecastGetResponseCity city = null;
  
  ForecastGetResponse();

  @override
  String toString() {
    return 'ForecastGetResponse[cod=$cod, message=$message, cnt=$cnt, list=$list, city=$city, ]';
  }

  ForecastGetResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    cod =
        json['cod']
    ;
    message =
        json['message']
    ;
    cnt =
        json['cnt']
    ;
    list =
      ForecastGetResponseList.listFromJson(json['list'])
;
    city =
      
      
      new ForecastGetResponseCity.fromJson(json['city'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list,
      'city': city
     };
  }

  static List<ForecastGetResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<ForecastGetResponse>() : json.map((value) => new ForecastGetResponse.fromJson(value)).toList();
  }

  static Map<String, ForecastGetResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ForecastGetResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ForecastGetResponse.fromJson(value));
    }
    return map;
  }
}

