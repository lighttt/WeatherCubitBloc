part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

/// The event part of bloc helps for event sourcing (action on buttons)
/// they are then dispatched to the states
/// whereas on the cubit it was just displaying the right widget
class GetWeather extends WeatherEvent {
  /// You do not need to do equality in terms of event and only on states
  final String cityName;

  GetWeather(this.cityName);
}
