import 'package:bloc_arch_counter/features/counter/presentation/bloc/counter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/counter_local_data_source.dart';
import 'data/repositories/counter_repository_impl.dart';
import 'domain/repositories/counter_repository.dart';
import 'domain/usecases/decrement_counter.dart';
import 'domain/usecases/increment_counter.dart';

Future<void> initCounterInjection() async {
  // 💾 Data Sources - 가장 하위 계층부터 등록
  sl.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(),
  );

  // 🗂 Repository - DataSource를 의존하므로 이후에 등록
  sl.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(localDataSource: sl()),
  );

  // 🎯 Use Cases - Repository를 의존하므로 이후에 등록
  sl.registerLazySingleton(() => IncrementCounter(sl()));
  sl.registerLazySingleton(() => DecrementCounter(sl()));

  // 📦 Bloc - UseCase를 의존하므로 가장 마지막에 등록
  sl.registerFactory(() => CounterBloc(
        incrementCounter: sl(),
        decrementCounter: sl(),
      ));
}
