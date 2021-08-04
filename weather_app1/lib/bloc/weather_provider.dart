import 'dart:convert';

import 'package:weather_app1/bloc/weather_bloc.dart';
import 'package:weather_app1/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  Future<WeatherModel> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '5452d8bda19e96bbe4ab066cddd371f8',
      'units': 'metric'
    };

    final url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}


