import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search a city"),),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              weatherModel = await WeatherService(Dio())
                  .getCurrentWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                )),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
