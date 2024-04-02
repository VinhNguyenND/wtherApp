import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_weather/Data/Repositories/Weather/weather_repository_impl.dart';
import 'package:my_weather/Domain/Entities/location_weather.dart';
import 'package:my_weather/Domain/Repositories/weather/weather_repository.dart';
import 'package:my_weather/Domain/Usecases/WeatherUsecase/weather_usecase.dart';
import 'package:my_weather/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();

  // repository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  //use case
  getIt.registerLazySingleton<WeatherUseCase>(() => WeatherUseCase(repository: getIt<WeatherRepository>()));
}
