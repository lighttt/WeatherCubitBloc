import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';
import 'package:flutter_cubit_bloc_tutorial/weather_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
          create: (context) => WeatherCubit(FakeWeatherRepository()),
          child: WeatherSearchPage()),
    );
  }
}
