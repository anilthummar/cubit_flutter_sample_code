
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body:
      BlocBuilder<CounterCubit, int>(
        builder: (context, count) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  '$count',
                  style: const TextStyle(fontSize: 24), // Optional: Add styling for text
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Icon(Icons.add),
                      onPressed: () => context.read<CounterCubit>().increment(),
                    ),
                    const SizedBox(width: 16), // Added space between buttons
                    ElevatedButton(
                      child: const Icon(Icons.remove),
                      onPressed: () => context.read<CounterCubit>().decrement(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
