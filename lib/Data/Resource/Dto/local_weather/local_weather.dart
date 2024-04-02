import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather/Data/Resource/Dto/local_weather/weather_dto.dart';
import '../../../../Domain/Entities/location_weather.dart';

part 'local_weather.g.dart';

@JsonSerializable()
class LocalWeather extends weatherLocation {

  @JsonKey(
    fromJson: _weatherFromJson,
    toJson:_weatherToJson,
  )
  final WeatherDto? weather;

  LocalWeather({
    super.aqi,
    super.cityName,
    super.clouds,
    super.countryCode,
    super.datetime,
    super.gust,
    super.lat,
    super.obTime,
    super.pod,
    super.precip,
    super.rh,
    super.temp,
    this.weather,
    super.windSpd
  }) : super(weather: weather);

  factory LocalWeather.fromJson(Map<String, dynamic> json) =>
      _$LocalWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$LocalWeatherToJson(this);

  static WeatherDto _weatherFromJson(Map<String, dynamic> json) {
    return WeatherDto.fromJson(json);
}

  static Map<String, dynamic>? _weatherToJson(WeatherDto? data) {
    return data?.toJson();
  }
}
