import 'package:bloc_practice_sample/features/presentation/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWithCubit extends StatelessWidget {
  const CounterWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<CounterCubit, int>(
        listener: (context, state) {
          // Check if state >= 5 and reset counter
          if (state >= 5) {
            context.read<CounterCubit>().resetCounter();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter reached 5 or more and was reset!'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cubit Counter Value: $state',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => context.read<CounterCubit>().increment(),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () => context.read<CounterCubit>().decrement(),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
