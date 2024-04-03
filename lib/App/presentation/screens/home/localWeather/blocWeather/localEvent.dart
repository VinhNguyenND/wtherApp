import 'package:equatable/equatable.dart';
import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';

abstract class LocationEvent extends Equatable {}

class LocalEvent extends LocationEvent {
  WeatherRequest request;

  LocalEvent( {required this.request});

  @override
  List<Object?> get props => [request];
}
