import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/decrement_counter.dart';
import '../../domain/usecases/increment_counter.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterBloc({
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(CounterState(count: 0)) {
    on<IncrementCounterEvent>((event, emit) async {
      final result = await incrementCounter(state.count);
      emit(CounterState(count: result.value));
    });

    on<DecrementCounterEvent>((event, emit) async {
      final result = await decrementCounter(state.count);
      emit(CounterState(count: result.value));
    });
  }
}
