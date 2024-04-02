import 'package:either_dart/either.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:my_weather/Data/Resource/Dto/local_weather/local_weather.dart';
import 'package:my_weather/Domain/Entities/location_weather.dart';
import 'package:my_weather/Domain/Repositories/weather/weather_repository.dart';

class WeatherUseCase {
  WeatherRepository repository;

  WeatherUseCase({required this.repository});

  Future<Either<String, WeatherResponse>> getLocalWeather(WeatherRequest request) async{
    return await repository.getWeatherLocation(request);
  }
}
