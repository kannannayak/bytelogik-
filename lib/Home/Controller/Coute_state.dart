import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  final int count;
CounterState(this.count);
CounterState copyWith({int? count}) {
    return CounterState(count ?? this.count);
  }
}
class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState(0));
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
void decrement() {
    state = state.copyWith(count: state.count - 1);
  }
void reset() {
    state = state.copyWith(count: 0);
  }
}final counterProvider = StateNotifierProvider<CounterNotifier, CounterState>(
  (ref) => CounterNotifier(),
);
