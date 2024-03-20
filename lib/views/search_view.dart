
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/%20get%20weather%20cubit/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search a city"),),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value)  {
           var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
           getWeatherCubit.getWeather(cityName: value);

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


