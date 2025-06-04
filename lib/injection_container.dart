import 'package:get_it/get_it.dart';

import 'features/counter/counter_injection.dart';

// sl is a common abbreviation for "Service Locator"
final sl = GetIt.instance;

Future<void> init() async {
  await initCounterInjection();
}
