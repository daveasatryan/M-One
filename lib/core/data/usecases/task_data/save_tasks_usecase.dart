import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:m_one_task/core/data/repositories/task_repository.dart';

@injectable
class SaveTasksUseCase {
  final TaskRepository repository;

  SaveTasksUseCase(this.repository);

  // Executes the use case to save a list of tasks to the repository.
  Future<void> call(List<TaskModel> tasks) async {
    await repository.saveTasks(tasks);
  }
}
