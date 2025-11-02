import 'package:get_it/get_it.dart';

// Retrieves an instance of type from the service locator.
class SlFactory {
  SlFactory({required GetIt getIt}) : _getIt = getIt;

  final GetIt _getIt;
  T get<T extends Object>() => _getIt.get<T>();
}
