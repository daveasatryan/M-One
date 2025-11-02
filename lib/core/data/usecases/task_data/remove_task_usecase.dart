import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/repositories/task_repository.dart';

@injectable
class RemoveTaskUsecase {
  final TaskRepository repository;

  RemoveTaskUsecase(this.repository);

  // Executes the use case to remove a task by its id from the repository.
  Future<void> call(String id) async {
    await repository.removeTask(id);
  }
}
