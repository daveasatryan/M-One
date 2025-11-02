import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:m_one_task/core/data/repositories/task_repository.dart';

@injectable
class UpdateTasksUsecase {
  final TaskRepository repository;

  UpdateTasksUsecase(this.repository);

  // Executes the use case to update the given tasks in the repository.
  Future<void> call(TaskModel tasks) async {
    await repository.updateTasks(tasks);
  }
}
