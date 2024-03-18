import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String key = '34fc27e4975c4071975121507241503';
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later');
    }
  }
}
