import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class ResetCounter {
  final CounterRepository repository;
  ResetCounter(this.repository);

  Future<Counter> call() async {
    return repository.reset();
  }
}
