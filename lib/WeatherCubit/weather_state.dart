import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_sample/WeatherCubit/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoaded(this.weatherModel);

  @override
  List<Object?> get props => [weatherModel];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];

}
