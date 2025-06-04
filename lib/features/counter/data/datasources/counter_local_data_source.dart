import '../../domain/entities/counter.dart';

abstract class CounterLocalDataSource {
  Future<Counter> increment(int currentCount);
  Future<Counter> decrement(int currentCount);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  @override
  Future<Counter> increment(int currentCount) async {
    // 예시: 로컬 저장소 없이 단순히 계산만 수행
    return Counter(value: currentCount + 1);
  }

  @override
  Future<Counter> decrement(int currentCount) async {
    return Counter(value: currentCount - 1);
  }
}
