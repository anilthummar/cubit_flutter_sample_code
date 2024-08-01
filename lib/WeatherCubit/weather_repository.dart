
import 'dart:math';

import 'package:flutter_cubit_sample/WeatherCubit/weather_model.dart';

abstract class WeatherRepository{
  Future<WeatherModel>fetchWeather(String cityName);
}

class NetworkException implements Exception {}

class FakeWeatherRepository extends WeatherRepository{

  @override
  Future<WeatherModel> fetchWeather(String cityName) {
// Simulate network delay
    return Future.delayed(
      const Duration(seconds: 1),
          () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return WeatherModel(
          cityName: cityName,
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }

}