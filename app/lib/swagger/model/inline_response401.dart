part of swagger.api;

class InlineResponse401 {
  
  String cod = null;
  

  String message = null;
  
  InlineResponse401();

  @override
  String toString() {
    return 'InlineResponse401[cod=$cod, message=$message, ]';
  }

  InlineResponse401.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    cod =
        json['cod']
    ;
    message =
        json['message']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'cod': cod,
      'message': message
     };
  }

  static List<InlineResponse401> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse401>() : json.map((value) => new InlineResponse401.fromJson(value)).toList();
  }

  static Map<String, InlineResponse401> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, InlineResponse401>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new InlineResponse401.fromJson(value));
    }
    return map;
  }
}

