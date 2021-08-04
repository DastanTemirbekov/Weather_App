import 'package:weather_app1/bloc/weather_provider.dart';
import 'package:weather_app1/model/weather_model.dart';

class WeatherRepository{
  Future<WeatherModel> getWeather(String city){
    WeatherProvider provider = WeatherProvider();
    return provider.getWeather(city);
  }
}