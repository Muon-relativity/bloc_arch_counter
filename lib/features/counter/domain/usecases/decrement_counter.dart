import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class DecrementCounter {
  final CounterRepository repository;
  DecrementCounter(this.repository);

  Future<Counter> call(int currentCount) async {
    return repository.decrement(currentCount);
  }
}
