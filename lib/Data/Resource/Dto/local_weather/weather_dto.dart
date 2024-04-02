import 'package:json_annotation/json_annotation.dart';

import '../../../../Domain/Entities/weather.dart';
part 'weather_dto.g.dart';
@JsonSerializable()
class WeatherDto extends Weather{
  WeatherDto(
      super.description,
      super.code,
      super.icon
      );
  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

   Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}