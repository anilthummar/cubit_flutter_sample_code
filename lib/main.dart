import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_sample/CartCubit/cart_cubit.dart';
import 'package:flutter_cubit_sample/LoginCubit/forgot_password_cubit.dart';
import 'package:flutter_cubit_sample/WeatherCubit/weather_repository.dart';
import 'CounterCubit/counter_cubit.dart';
import 'LoginCubit/login_cubit.dart';
import 'WeatherCubit/weather_cubit.dart';
import 'home_page.dart';

void main() {
  runApp(const CubitCounterApp());
}

class CubitCounterApp extends StatelessWidget {
  const CubitCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>CounterCubit(),
        ),
        BlocProvider(
          create: (context) =>CartCubit(),
        ),
        BlocProvider(
          create: (context) =>WeatherCubit(FakeWeatherRepository()),
        ),
        BlocProvider(
          create: (context) =>LoginCubit(),
        ),
        BlocProvider(
          create: (context) =>ForgotPasswordCubit(),
        ),

      ],
      child:   const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }

}




