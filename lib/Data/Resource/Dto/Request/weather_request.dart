import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather/Data/Resource/Dto/local_weather/local_weather.dart';
part 'weather_request.g.dart';

@JsonSerializable()
class WeatherRequest {
  String? lat;
  String? lon;
  WeatherRequest({
    required this.lat,
    required this.lon,
  });

  factory WeatherRequest.fromJson(Map<String, dynamic> json) =>
      _$WeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRequestToJson(this);
}

@JsonSerializable()
class WeatherResponse {
  int? count;
  @JsonKey(
    fromJson: _weatherFromJson,
    toJson: _weatherToJson,
  )
  final List<LocalWeather>? data;

  WeatherResponse({this.count, this.data});
  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  static List<LocalWeather> _weatherFromJson(List<dynamic> json) {
    return json.map((e) => LocalWeather.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>>? _weatherToJson(List<LocalWeather>? data) {
    return data?.map((e) => e.toJson()).toList();
  }
}
