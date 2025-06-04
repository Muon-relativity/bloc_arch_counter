class Counter {
  final int value;

  const Counter({required this.value});

  @override
  String toString() => 'Counter(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Counter && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
