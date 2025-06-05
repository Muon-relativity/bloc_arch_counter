import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_data_source.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<Counter> decrement(int currentCount) {
    return localDataSource.decrement(currentCount);
  }

  @override
  Future<Counter> increment(int currentCount) {
    return localDataSource.increment(currentCount);
  }

  @override
  Future<Counter> reset() {
    return localDataSource.reset();
  }
}
