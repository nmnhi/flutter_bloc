import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice_sample/features/presentation/bloc/counter_cubit.dart';
import 'package:bloc_practice_sample/features/presentation/pages/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
