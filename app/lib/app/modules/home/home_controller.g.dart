// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$markersAtom = Atom(name: '_HomeControllerBase.markers');

  @override
  ObservableList<dynamic> get markers {
    _$markersAtom.context.enforceReadPolicy(_$markersAtom);
    _$markersAtom.reportObserved();
    return super.markers;
  }

  @override
  set markers(ObservableList<dynamic> value) {
    _$markersAtom.context.conditionallyRunInAction(() {
      super.markers = value;
      _$markersAtom.reportChanged();
    }, _$markersAtom, name: '${_$markersAtom.name}_set');
  }

  final _$latLngAtom = Atom(name: '_HomeControllerBase.latLng');

  @override
  LatLng get latLng {
    _$latLngAtom.context.enforceReadPolicy(_$latLngAtom);
    _$latLngAtom.reportObserved();
    return super.latLng;
  }

  @override
  set latLng(LatLng value) {
    _$latLngAtom.context.conditionallyRunInAction(() {
      super.latLng = value;
      _$latLngAtom.reportChanged();
    }, _$latLngAtom, name: '${_$latLngAtom.name}_set');
  }

  final _$weatherModelAtom = Atom(name: '_HomeControllerBase.weatherModel');

  @override
  WeatherModel get weatherModel {
    _$weatherModelAtom.context.enforceReadPolicy(_$weatherModelAtom);
    _$weatherModelAtom.reportObserved();
    return super.weatherModel;
  }

  @override
  set weatherModel(WeatherModel value) {
    _$weatherModelAtom.context.conditionallyRunInAction(() {
      super.weatherModel = value;
      _$weatherModelAtom.reportChanged();
    }, _$weatherModelAtom, name: '${_$weatherModelAtom.name}_set');
  }

  final _$getWeatherInfoAsyncAction = AsyncAction('getWeatherInfo');

  @override
  Future<dynamic> getWeatherInfo() {
    return _$getWeatherInfoAsyncAction.run(() => super.getWeatherInfo());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setLatLng(LatLng _latLng) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setLatLng(_latLng);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMarkes(String _markerId, LatLng _latLng) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.addMarkes(_markerId, _latLng);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'markers: ${markers.toString()},latLng: ${latLng.toString()},weatherModel: ${weatherModel.toString()}';
    return '{$string}';
  }
}
