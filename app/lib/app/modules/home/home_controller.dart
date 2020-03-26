import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList markers = ObservableList.of([]);

  @observable
  LatLng latLng;

  @action
  setLatLng(LatLng _latLng) => latLng = _latLng;

  @action
  addMarkes(String _markerId, LatLng _latLng) {
    markers.add(
      Marker(
        markerId: MarkerId(_markerId),
        draggable: false,
        position: _latLng,
      ),
    );
  }
}
