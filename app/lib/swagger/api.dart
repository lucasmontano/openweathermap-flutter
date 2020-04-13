library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/forecast_api.dart';
part 'api/weather_api.dart';

part 'model/forecast_get_response.dart';
part 'model/forecast_get_response_city.dart';
part 'model/forecast_get_response_city_coord.dart';
part 'model/forecast_get_response_list.dart';
part 'model/forecast_get_response_sys.dart';
part 'model/forecast_get_response_weather.dart';
part 'model/inline_response401.dart';
part 'model/weather_get_resonse.dart';
part 'model/weather_get_resonse_cloud.dart';
part 'model/weather_get_resonse_coord.dart';
part 'model/weather_get_resonse_main.dart';
part 'model/weather_get_resonse_sys.dart';
part 'model/weather_get_resonse_weather.dart';
part 'model/weather_get_resonse_wind.dart';


ApiClient defaultApiClient =  ApiClient();
