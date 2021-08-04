import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app1/bloc/weather_repository.dart';
import 'package:weather_app1/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository = WeatherRepository();
  WeatherBloc(this.repository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    try {
      if (event is GetWeatherEvent) {
        yield WeatherInitial();
        yield WeatherLoading();
        WeatherModel data = await repository.getWeather(event.city);
        yield WeatherLoaded(data);
      }
    } catch (e) {
      yield WeatherError(e.toString());
    }
  }
}
