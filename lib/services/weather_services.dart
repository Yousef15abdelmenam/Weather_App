import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '7a6b171f3b414c65b35124553241110';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? 'oops there is an error';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is ana error');
    }
  }
}
