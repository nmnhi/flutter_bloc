import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc_event.dart';
import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWithBloc extends StatelessWidget {
  const CounterWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counterValue == 5) {
            context.read<CounterBloc>().add(ResetCounter());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter reached 5 so reset counter!'),
              ),
            );
          } else if (state.counterValue == -5) {
            context.read<CounterBloc>().add(ResetCounter());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter reached -5 so reset counter!'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bloc Counter Value: ${state.counterValue}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(IncrementCounter()),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(DecrementCounter()),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
