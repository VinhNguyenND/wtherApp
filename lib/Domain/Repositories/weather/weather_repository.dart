import 'package:either_dart/either.dart';
import 'package:my_weather/App/presentation/screens/home/home_screen.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:my_weather/Data/Resource/Dto/local_weather/local_weather.dart';
import 'package:my_weather/Domain/Repositories/base/base_failure.dart';

abstract class WeatherRepository {
  Future<Either<String, WeatherResponse>> getWeatherLocation(
      WeatherRequest request);
}
