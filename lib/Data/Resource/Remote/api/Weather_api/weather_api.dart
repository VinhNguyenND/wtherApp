import 'package:dio/dio.dart';
import 'package:my_weather/App/presentation/screens/home/home_screen.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Dto/local_weather/local_weather.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: 'https://weatherbit-v1-mashape.p.rapidapi.com')
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String? baseUrl}) = _WeatherApi;

  @GET("/current")
  Future<WeatherResponse> getWeatherCurrentLocal(@Queries() WeatherRequest request);
}
