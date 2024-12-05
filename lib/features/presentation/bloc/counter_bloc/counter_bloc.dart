import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc_event.dart';
import 'package:bloc_practice_sample/features/presentation/bloc/counter_bloc/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementCounter>(
        (event, emit) => emit(CounterState(state.counterValue + 1)));
    on<DecrementCounter>(
        (event, emit) => emit(CounterState(state.counterValue - 1)));

    on<ResetCounter>((event, emit) => emit(const CounterState(0)));
  }
}
