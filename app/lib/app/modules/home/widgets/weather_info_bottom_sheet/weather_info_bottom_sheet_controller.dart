import 'package:mobx/mobx.dart';

part 'weather_info_bottom_sheet_controller.g.dart';

class WeatherInfoBottomSheetController = _WeatherInfoBottomSheetControllerBase
    with _$WeatherInfoBottomSheetController;

abstract class _WeatherInfoBottomSheetControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
