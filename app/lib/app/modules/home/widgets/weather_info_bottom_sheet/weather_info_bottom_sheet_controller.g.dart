// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_bottom_sheet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherInfoBottomSheetController
    on _WeatherInfoBottomSheetControllerBase, Store {
  final _$forecastGetResponseAtom =
      Atom(name: '_WeatherInfoBottomSheetControllerBase.forecastGetResponse');

  @override
  ForecastGetResponse get forecastGetResponse {
    _$forecastGetResponseAtom.context
        .enforceReadPolicy(_$forecastGetResponseAtom);
    _$forecastGetResponseAtom.reportObserved();
    return super.forecastGetResponse;
  }

  @override
  set forecastGetResponse(ForecastGetResponse value) {
    _$forecastGetResponseAtom.context.conditionallyRunInAction(() {
      super.forecastGetResponse = value;
      _$forecastGetResponseAtom.reportChanged();
    }, _$forecastGetResponseAtom,
        name: '${_$forecastGetResponseAtom.name}_set');
  }

  final _$getForecastResponseAsyncAction = AsyncAction('getForecastResponse');

  @override
  Future<void> getForecastResponse(double lat, double lon) {
    return _$getForecastResponseAsyncAction
        .run(() => super.getForecastResponse(lat, lon));
  }

  @override
  String toString() {
    final string = 'forecastGetResponse: ${forecastGetResponse.toString()}';
    return '{$string}';
  }
}
