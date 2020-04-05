import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

extension MarkerExtension on Marker {
  dynamic fromJson(dynamic value) => json.decode(value);

  String toJson() => {
        "markerId": this.markerId.value,
        "positon": this.position.toJson(),
        "infoWindow": this.infoWindow.toJson(),
      }.toString();
}

extension PositionExtension on LatLng {
  dynamic fromJson(dynamic value) => json.decode(value);

  String toJson() =>
      {"latitude": this.latitude, "longitude": this.longitude}.toString();
}

extension InfoWindowExtension on InfoWindow {
  dynamic fromJson(dynamic value) => json.decode(value);

  String toJson() => {"title": this.title, "snippet": this.snippet}.toString();
}
