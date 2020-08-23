import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc_part/weather_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';
import 'file:///D:/Flutter%20Projects/Research/weather-cubit-bloc/lib/cubit_part/weather_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
          create: (context) => WeatherBloc(FakeWeatherRepository()),
          child: WeatherSearchPage()),
    );
  }
}
