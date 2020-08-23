import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

/// Bloc composes of both events = actions and state = UI
/// Here the first state is initial weather state
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  /// the mapEventToState function basically maps the actions that
  /// occurs to the right state of your UI
  /// Stream is the pipeline of data in this case : WeatherState
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      try {
        /// Yield adds the states to the stream that our UI gets
        /// it is similar to the return but  it does not terminates the function
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError("Something error has occurred! Please try again");
      }
    }
  }
}
