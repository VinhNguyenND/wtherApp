import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['X-RapidAPI-Key'] = 'd5e6fb3829mshfb4f3210fa122aap1810f0jsn2fdb909d2a12';
    options.headers['X-RapidAPI-Host'] = 'weatherbit-v1-mashape.p.rapidapi.com';

    return super.onRequest(options, handler);
  }
}
//me 76373408e2mshdd1b501acbcbf46p1b09c4jsn6300c60e03f5
//anh kien 4cf72fa9eemsha596c4714e81ceep1a2ef9jsn86f346458619
