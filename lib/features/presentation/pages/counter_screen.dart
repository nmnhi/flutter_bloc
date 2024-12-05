import 'package:bloc_practice_sample/features/presentation/pages/counter_with_bloc.dart';
import 'package:bloc_practice_sample/features/presentation/pages/counter_with_cubit.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App with Cubit & Bloc'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cubit'),
              Tab(text: 'Bloc'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Cubit Counter Screen
            CounterWithCubit(),

            // Bloc Counter Screen
            CounterWithBloc(),
          ],
        ),
      ),
    );
  }
}
