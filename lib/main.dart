import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/%20get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/%20get%20weather%20cubit/get_weather_states.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue; // Default color if condition is null
  }

  final lowercaseCondition = condition.toLowerCase();

  switch (lowercaseCondition) {
    case 'sunny':
      return Colors.yellow;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain':
      return Colors.lightBlue;
    case 'patchy snow':
      return Colors.lightBlue;
    case 'patchy sleet':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.blue;
    case 'thunderstorms':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.blueGrey;
    case 'blizzard':
      return Colors.blueGrey;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain':
      return Colors.lightBlue;
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
      return Colors.blue;
    case 'moderate freezing rain':
      return Colors.blue;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'moderate snow':
      return Colors.lightBlue;
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.blueGrey;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate rain shower':
      return Colors.lightBlue;
    case 'torrential rain showers':
      return Colors.lightBlue;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
      return Colors.blueGrey;
    case 'moderate showers of ice pellets':
      return Colors.blueGrey;
    case 'light rain with thunder':
      return Colors.deepPurple;
    case 'moderate rain with thunder':
      return Colors.deepPurple;
    case 'light snow with thunder':
      return Colors.deepPurple;
    case 'moderate snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blueGrey; // Default color for unknown conditions
  }
}