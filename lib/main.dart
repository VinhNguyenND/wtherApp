import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:my_weather/Data/Resource/Remote/api/Weather_api/api_weather_provider.dart';
import 'package:my_weather/Domain/Usecases/WeatherUsecase/weather_usecase.dart';
import 'App/presentation/app.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(); // init DI
  await EasyLocalization.ensureInitialized(); // init localization
  // await EnvConfigs.init();
  ApiWeahterProvider.init(); // init api client
  // final test = getIt<WeatherUseCase>();
  // final res = await test.getLocalWeather(WeatherRequest(lat: "35.0", lon: "-78.5"));
  // print(res.right);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
    path: 'assets/translations',
    fallbackLocale: const Locale('vi', 'VN'),
    startLocale: const Locale('vi', 'VN'),
    child: const MyApp(),
  ));

}
