import 'package:equatable/equatable.dart';
import 'package:my_weather/Domain/Entities/weather.dart';

class weatherLocation extends Equatable{
  //chất lượng không khí
  int? aqi;

  //Tên thành phố
  String? cityName;

  //Mây phủ
  int? clouds;

  //Mã quốc gia
  String? countryCode;

  //Thời gian
  String? datetime;

  //Gió mạnh nhất
  double? gust;

  //Kinh độ
  double? lat;

  //Vĩ độ
  String? obTime;

  //Buổi của ngày
  String? pod;

  //Lượng mưa
  int? precip;

  // độ ẩm
  int? rh;

  //Nhiệt độ
  double? temp;

  //Thời tiết
  Weather? weather;

  //Tốc độ gió
  double? windSpd;


  weatherLocation({
      this.aqi,
      this.cityName,
      this.clouds,
      this.countryCode,
      this.datetime,
      this.gust,
      this.lat,
      this.obTime,
      this.pod,
      this.precip,
      this.rh,
      this.temp,
      this.weather,
      this.windSpd});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

