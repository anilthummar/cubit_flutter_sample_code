import 'package:flutter/material.dart';
import 'package:flutter_cubit_sample/CounterCubit/counter_cubit_page.dart';

import 'CartCubit/cart_page.dart';
import 'LoginCubit/login_page.dart';
import 'WeatherCubit/weather_search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text('Home') ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage()));
          }, child: const Text("Counter Cubit Example"),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartPage()));
          }, child: const Text("Cart Cubit Example"),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  WeatherSearchPage()));
          }, child: const Text("Weather Cubit Example"),),

          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginPage()));
          }, child: const Text("Login Cubit Example"),),
        ],
      ),
    );
  }
}
