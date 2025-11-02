import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:m_one_task/core/data/repositories/task_repository.dart';

@injectable
class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  // Executes the use case to retrieve all tasks from the repository.
  Future<List<TaskModel>> call() async {
    return repository.getTasks();
  }
}
