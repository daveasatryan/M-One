import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/data_sources/task_data_source.dart';
import 'package:m_one_task/core/data/models/task_model.dart';

abstract class TaskRepository {
  // Retrieves all stored tasks.
  Future<List<TaskModel>> getTasks();

  // Saves a list of tasks to persistent storage.
  Future<void> saveTasks(List<TaskModel> tasks);

  // Clears all tasks from storage.
  Future<void> clearTasks();

  // Removes a task by its id.
  Future<void> removeTask(String id);

  // Updates a specific task with new data.
  Future<void> updateTasks(TaskModel task);
}

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource tasksDataSource;

  TaskRepositoryImpl(this.tasksDataSource);

  @override
  Future<List<TaskModel>> getTasks() => tasksDataSource.getTasks();

  @override
  Future<void> saveTasks(List<TaskModel> tasks) =>
      tasksDataSource.saveTasks(tasks);

  @override
  Future<void> clearTasks() => tasksDataSource.clearTasks();

  @override
  Future<void> updateTasks(TaskModel task) => tasksDataSource.updateTask(task);

  @override
  Future<void> removeTask(String id) => tasksDataSource.removeTask(id);
}
