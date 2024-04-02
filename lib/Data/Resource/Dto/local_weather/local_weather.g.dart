// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalWeather _$LocalWeatherFromJson(Map<String, dynamic> json) => LocalWeather(
      aqi: json['aqi'] as int?,
      cityName: json['cityName'] as String?,
      clouds: json['clouds'] as int?,
      countryCode: json['countryCode'] as String?,
      datetime: json['datetime'] as String?,
      gust: (json['gust'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      obTime: json['obTime'] as String?,
      pod: json['pod'] as String?,
      precip: json['precip'] as int?,
      rh: json['rh'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      weather: LocalWeather._weatherFromJson(
          json['weather'] as Map<String, dynamic>),
      windSpd: (json['windSpd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocalWeatherToJson(LocalWeather instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'cityName': instance.cityName,
      'clouds': instance.clouds,
      'countryCode': instance.countryCode,
      'datetime': instance.datetime,
      'gust': instance.gust,
      'lat': instance.lat,
      'obTime': instance.obTime,
      'pod': instance.pod,
      'precip': instance.precip,
      'rh': instance.rh,
      'temp': instance.temp,
      'windSpd': instance.windSpd,
      'weather': LocalWeather._weatherToJson(instance.weather),
    };
