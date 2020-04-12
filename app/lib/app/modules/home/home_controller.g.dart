// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<ObservableList<Marker>> _$savedBookmarksComputed;

  @override
  ObservableList<Marker> get savedBookmarks => (_$savedBookmarksComputed ??=
          Computed<ObservableList<Marker>>(() => super.savedBookmarks))
      .value;

  final _$googleMapControllerAtom =
      Atom(name: '_HomeControllerBase.googleMapController');

  @override
  GoogleMapController get googleMapController {
    _$googleMapControllerAtom.context
        .enforceReadPolicy(_$googleMapControllerAtom);
    _$googleMapControllerAtom.reportObserved();
    return super.googleMapController;
  }

  @override
  set googleMapController(GoogleMapController value) {
    _$googleMapControllerAtom.context.conditionallyRunInAction(() {
      super.googleMapController = value;
      _$googleMapControllerAtom.reportChanged();
    }, _$googleMapControllerAtom,
        name: '${_$googleMapControllerAtom.name}_set');
  }

  final _$temporaryMarkersAtom =
      Atom(name: '_HomeControllerBase.temporaryMarkers');

  @override
  ObservableList<dynamic> get temporaryMarkers {
    _$temporaryMarkersAtom.context.enforceReadPolicy(_$temporaryMarkersAtom);
    _$temporaryMarkersAtom.reportObserved();
    return super.temporaryMarkers;
  }

  @override
  set temporaryMarkers(ObservableList<dynamic> value) {
    _$temporaryMarkersAtom.context.conditionallyRunInAction(() {
      super.temporaryMarkers = value;
      _$temporaryMarkersAtom.reportChanged();
    }, _$temporaryMarkersAtom, name: '${_$temporaryMarkersAtom.name}_set');
  }

  final _$weatherGetResponseListAtom =
      Atom(name: '_HomeControllerBase.weatherGetResponseList');

  @override
  ObservableList<WeatherGetResponse> get weatherGetResponseList {
    _$weatherGetResponseListAtom.context
        .enforceReadPolicy(_$weatherGetResponseListAtom);
    _$weatherGetResponseListAtom.reportObserved();
    return super.weatherGetResponseList;
  }

  @override
  set weatherGetResponseList(ObservableList<WeatherGetResponse> value) {
    _$weatherGetResponseListAtom.context.conditionallyRunInAction(() {
      super.weatherGetResponseList = value;
      _$weatherGetResponseListAtom.reportChanged();
    }, _$weatherGetResponseListAtom,
        name: '${_$weatherGetResponseListAtom.name}_set');
  }

  final _$isDarkAtom = Atom(name: '_HomeControllerBase.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.context.enforceReadPolicy(_$isDarkAtom);
    _$isDarkAtom.reportObserved();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.context.conditionallyRunInAction(() {
      super.isDark = value;
      _$isDarkAtom.reportChanged();
    }, _$isDarkAtom, name: '${_$isDarkAtom.name}_set');
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

  final _$weatherGetResponseAtom =
      Atom(name: '_HomeControllerBase.weatherGetResponse');

  @override
  WeatherGetResponse get weatherGetResponse {
    _$weatherGetResponseAtom.context
        .enforceReadPolicy(_$weatherGetResponseAtom);
    _$weatherGetResponseAtom.reportObserved();
    return super.weatherGetResponse;
  }

  @override
  set weatherGetResponse(WeatherGetResponse value) {
    _$weatherGetResponseAtom.context.conditionallyRunInAction(() {
      super.weatherGetResponse = value;
      _$weatherGetResponseAtom.reportChanged();
    }, _$weatherGetResponseAtom, name: '${_$weatherGetResponseAtom.name}_set');
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

  final _$addressAtom = Atom(name: '_HomeControllerBase.address');

  @override
  String get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }

  final _$getWeatherResponseAsyncAction = AsyncAction('getWeatherResponse');

  @override
  Future<void> getWeatherResponse() {
    return _$getWeatherResponseAsyncAction
        .run(() => super.getWeatherResponse());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setGoogleMapController(GoogleMapController controller) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setGoogleMapController(controller);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDark(bool _value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setIsDark(_value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsExploring(bool _value) {
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
  dynamic setAddress(String _address) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setAddress(_address);
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
  dynamic onAddTemporaryMarkers(
      String _markerId, LatLng _latLng, Widget _bottomSheet) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.onAddTemporaryMarkers(_markerId, _latLng, _bottomSheet);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onBookmarked(WeatherGetResponse weatherGetResponse) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.onBookmarked(weatherGetResponse);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRemoveBookmark(String _markerId) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.onRemoveBookmark(_markerId);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'googleMapController: ${googleMapController.toString()},temporaryMarkers: ${temporaryMarkers.toString()},weatherGetResponseList: ${weatherGetResponseList.toString()},isDark: ${isDark.toString()},isExploring: ${isExploring.toString()},isForRemove: ${isForRemove.toString()},latLng: ${latLng.toString()},weatherGetResponse: ${weatherGetResponse.toString()},context: ${context.toString()},address: ${address.toString()},savedBookmarks: ${savedBookmarks.toString()}';
    return '{$string}';
  }
}
