import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'widgets/weather_info_bottom_sheet/weather_info_bottom_sheet_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WeatherInfoBottomSheetController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
