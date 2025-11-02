import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/repositories/task_repository.dart';

@injectable
class ClearTasksUseCase {
  final TaskRepository repository;

  ClearTasksUseCase(this.repository);

  // Executes the use case to clear all tasks from the repository.
  Future<void> call() async {
    await repository.clearTasks();
  }
}
