import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class IncrementCounter {
  final CounterRepository repository;
  IncrementCounter(this.repository);

  Future<Counter> call(int currentCount) async {
    return repository.increment(currentCount);
  }
}
