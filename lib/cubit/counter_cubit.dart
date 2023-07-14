import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0, wasIncremented: true));

  void increment() => emit(CounterState(count: state.count + 1, wasIncremented: true));
  void decrement(){
    if(state.count <= 0) return;
    emit(CounterState(count: state.count - 1, wasIncremented: false));
  }
}
