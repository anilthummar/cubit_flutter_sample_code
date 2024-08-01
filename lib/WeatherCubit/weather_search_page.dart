
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_sample/WeatherCubit/weather_cubit.dart';
import 'package:flutter_cubit_sample/WeatherCubit/weather_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherSearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter city name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherCubit>().getWeather(_controller.text);
              },
              child: Text("Search"),
            ),
            SizedBox(height: 20),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Text("Please enter a city name.");
                } else if (state is WeatherLoading) {
                  return CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Text(
                    "Temperature in ${state.weatherModel.cityName}: ${state.weatherModel.temperatureCelsius.toStringAsFixed(2)}°C",
                  );
                } else if (state is WeatherError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
