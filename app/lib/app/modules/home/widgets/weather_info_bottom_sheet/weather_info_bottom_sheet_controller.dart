import 'package:app_client/swagger/api.dart';
import 'package:mobx/mobx.dart';

part 'weather_info_bottom_sheet_controller.g.dart';

class WeatherInfoBottomSheetController = _WeatherInfoBottomSheetControllerBase
    with _$WeatherInfoBottomSheetController;

abstract class _WeatherInfoBottomSheetControllerBase with Store {
  @observable
  ForecastGetResponse forecastGetResponse;

  @action
  Future<void> getForecastResponse(double lat, double lon) async{
    forecastGetResponse = await ForecastApi().forecastGet(lat, lon, "c6e381d8c7ff98f0fee43775817cf6ad", "metric");
  }
}
