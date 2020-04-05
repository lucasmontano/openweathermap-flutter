
class MarkerModel {
    MarkerId markerId;
    Positon positon;
    InfoWindow infoWindow;

    MarkerModel({
        this.markerId,
        this.positon,
        this.infoWindow,
    });

    factory MarkerModel.fromJson(Map<String, dynamic> json) => MarkerModel(
        markerId: MarkerId.fromJson(json["markerId"]),
        positon: Positon.fromJson(json["positon"]),
        infoWindow: InfoWindow.fromJson(json["infoWindow"]),
    );

    Map<String, dynamic> toJson() => {
        "markerId": markerId.toJson(),
        "positon": positon.toJson(),
        "infoWindow": infoWindow.toJson(),
    };
}

class InfoWindow {
    String title;
    String snippet;

    InfoWindow({
        this.title,
        this.snippet,
    });

    factory InfoWindow.fromJson(Map<String, dynamic> json) => InfoWindow(
        title: json["title"],
        snippet: json["snippet"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "snippet": snippet,
    };
}

class MarkerId {
    String value;

    MarkerId({
        this.value,
    });

    factory MarkerId.fromJson(Map<String, dynamic> json) => MarkerId(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}

class Positon {
    double latitude;
    double longitude;

    Positon({
        this.latitude,
        this.longitude,
    });

    factory Positon.fromJson(Map<String, dynamic> json) => Positon(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}