import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:m_one_task/core/data/utilities/storage/preferences_manager.dart';

abstract class TaskDataSource {
  // Retrieves the list of all saved tasks.
  Future<List<TaskModel>> getTasks();

  // Saves a list of tasks to persistent storage.
  Future<void> saveTasks(List<TaskModel> tasks);

  // Removes a task by its.
  Future<void> removeTask(String id);

  // Updates an existing task with new data.
  Future<void> updateTask(TaskModel task);

  // Clears all tasks from storage.
  Future<void> clearTasks();
}

@LazySingleton(as: TaskDataSource)
class TaskDataSourceImpl implements TaskDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    final tasks = PreferencesManager.getTasks;
    return tasks;
  }

  @override
  Future<void> saveTasks(List<TaskModel> tasks) async {
    await PreferencesManager.saveTasks(tasks);
  }

  @override
  Future<void> removeTask(String id) async {
    final currentTasks = await getTasks();
    currentTasks.removeWhere((t) => t.id == id);
    await saveTasks(currentTasks);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final currentTasks = await getTasks();
    final index = currentTasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      currentTasks[index] = task;
      await saveTasks(currentTasks);
    }
  }

  @override
  Future<void> clearTasks() async {
    await PreferencesManager.clearTasks();
  }
}
