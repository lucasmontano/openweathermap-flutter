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

  final _$markersSaveAtom = Atom(name: '_HomeControllerBase.markersSave');

  @override
  ObservableList<dynamic> get markersSave {
    _$markersSaveAtom.context.enforceReadPolicy(_$markersSaveAtom);
    _$markersSaveAtom.reportObserved();
    return super.markersSave;
  }

  @override
  set markersSave(ObservableList<dynamic> value) {
    _$markersSaveAtom.context.conditionallyRunInAction(() {
      super.markersSave = value;
      _$markersSaveAtom.reportChanged();
    }, _$markersSaveAtom, name: '${_$markersSaveAtom.name}_set');
  }

  final _$isExploringAtom = Atom(name: '_HomeControllerBase.isExploring');

  @override
  bool get isExploring {
    _$isExploringAtom.context.enforceReadPolicy(_$isExploringAtom);
    _$isExploringAtom.reportObserved();
    return super.isExploring;
  }

  @override
  set isExploring(bool value) {
    _$isExploringAtom.context.conditionallyRunInAction(() {
      super.isExploring = value;
      _$isExploringAtom.reportChanged();
    }, _$isExploringAtom, name: '${_$isExploringAtom.name}_set');
  }

  final _$isForRemoveAtom = Atom(name: '_HomeControllerBase.isForRemove');

  @override
  bool get isForRemove {
    _$isForRemoveAtom.context.enforceReadPolicy(_$isForRemoveAtom);
    _$isForRemoveAtom.reportObserved();
    return super.isForRemove;
  }

  @override
  set isForRemove(bool value) {
    _$isForRemoveAtom.context.conditionallyRunInAction(() {
      super.isForRemove = value;
      _$isForRemoveAtom.reportChanged();
    }, _$isForRemoveAtom, name: '${_$isForRemoveAtom.name}_set');
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

  final _$contextAtom = Atom(name: '_HomeControllerBase.context');

  @override
  BuildContext get context {
    _$contextAtom.context.enforceReadPolicy(_$contextAtom);
    _$contextAtom.reportObserved();
    return super.context;
  }

  @override
  set context(BuildContext value) {
    _$contextAtom.context.conditionallyRunInAction(() {
      super.context = value;
      _$contextAtom.reportChanged();
    }, _$contextAtom, name: '${_$contextAtom.name}_set');
  }

  final _$getWeatherInfoAsyncAction = AsyncAction('getWeatherInfo');

  @override
  Future<dynamic> getWeatherInfo() {
    return _$getWeatherInfoAsyncAction.run(() => super.getWeatherInfo());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setIsExploring(bool _value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setIsExploring(_value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsForRemove(bool _value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setIsForRemove(_value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContext(BuildContext _context) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setContext(_context);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic addMarkes(String _markerId, LatLng _latLng, Widget _bottomSheet) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.addMarkes(_markerId, _latLng, _bottomSheet);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMarkes() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.removeMarkes();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveMarker(String _markerId, LatLng _latLng, Widget _bottomSheet) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.saveMarker(_markerId, _latLng, _bottomSheet);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMarkersSave(String a) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.removeMarkersSave(a);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'markers: ${markers.toString()},markersSave: ${markersSave.toString()},isExploring: ${isExploring.toString()},isForRemove: ${isForRemove.toString()},latLng: ${latLng.toString()},weatherModel: ${weatherModel.toString()},context: ${context.toString()}';
    return '{$string}';
  }
}
