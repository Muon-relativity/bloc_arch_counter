import '../entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> increment(int currentCount);
  Future<Counter> decrement(int currentCount);
}
