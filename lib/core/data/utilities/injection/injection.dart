import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/utilities/injection/injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async => GetIt.instance.init();
