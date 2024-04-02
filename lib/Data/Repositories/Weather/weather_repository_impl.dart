import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:my_weather/App/presentation/screens/home/home_screen.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:my_weather/Data/Resource/Remote/api/Weather_api/api_weather_provider.dart';
import 'package:my_weather/Domain/Repositories/base/base_failure.dart';
import 'package:my_weather/Domain/Repositories/weather/weather_repository.dart';

import '../../Resource/Dto/local_weather/local_weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final _apiClient = ApiWeahterProvider.weatherApi;

  @override
  Future<Either<String, WeatherResponse>> getWeatherLocation(
      WeatherRequest request) async {
    try {
      final response =
          await _apiClient?.getWeatherCurrentLocal(request);
      return Right(response!);
    } catch (e, s) {
      print('error $e $s');
      return Left(e.toString());
    }
  }
}
