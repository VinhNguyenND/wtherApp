import 'package:dio/dio.dart';
import 'package:my_weather/Data/Resource/Remote/api/ApiInterceptors.dart';
import 'package:my_weather/Data/Resource/Remote/api/Weather_api/weather_api.dart';

class ApiWeahterProvider {
  static WeatherApi? weatherApi;

  static Future<void> init() async {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.interceptors.addAll([
      ApiInterceptors(),
    ]);
    weatherApi = WeatherApi(dio,baseUrl: "https://weatherbit-v1-mashape.p.rapidapi.com");
  }
}
