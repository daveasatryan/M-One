// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:m_one_task/core/data/data_sources/task_data_source.dart'
    as _i347;
import 'package:m_one_task/core/data/repositories/task_repository.dart'
    as _i875;
import 'package:m_one_task/core/data/usecases/task_data/clear_tasks_usecase.dart'
    as _i427;
import 'package:m_one_task/core/data/usecases/task_data/get_tasks_usecase.dart'
    as _i751;
import 'package:m_one_task/core/data/usecases/task_data/remove_task_usecase.dart'
    as _i1058;
import 'package:m_one_task/core/data/usecases/task_data/save_tasks_usecase.dart'
    as _i394;
import 'package:m_one_task/core/data/usecases/task_data/update_tasks_usecase.dart'
    as _i561;
import 'package:m_one_task/core/presentation/views/todos_page/store/todos_store.dart'
    as _i102;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i347.TaskDataSource>(() => _i347.TaskDataSourceImpl());
    gh.lazySingleton<_i875.TaskRepository>(
      () => _i875.TaskRepositoryImpl(gh<_i347.TaskDataSource>()),
    );
    gh.factory<_i1058.RemoveTaskUsecase>(
      () => _i1058.RemoveTaskUsecase(gh<_i875.TaskRepository>()),
    );
    gh.factory<_i394.SaveTasksUseCase>(
      () => _i394.SaveTasksUseCase(gh<_i875.TaskRepository>()),
    );
    gh.factory<_i427.ClearTasksUseCase>(
      () => _i427.ClearTasksUseCase(gh<_i875.TaskRepository>()),
    );
    gh.factory<_i561.UpdateTasksUsecase>(
      () => _i561.UpdateTasksUsecase(gh<_i875.TaskRepository>()),
    );
    gh.factory<_i751.GetTasksUseCase>(
      () => _i751.GetTasksUseCase(gh<_i875.TaskRepository>()),
    );
    gh.factory<_i102.TodosStore>(
      () => _i102.TodosStore(
        gh<_i751.GetTasksUseCase>(),
        gh<_i394.SaveTasksUseCase>(),
        gh<_i427.ClearTasksUseCase>(),
        gh<_i561.UpdateTasksUsecase>(),
        gh<_i1058.RemoveTaskUsecase>(),
      ),
    );
    return this;
  }
}
