import 'dart:convert';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  PreferencesManager._();

  static late SharedPreferences _pref;

  static const _tasksKey = 'tasks';

  // Initializes the SharedPreferences instance.
  static Future<void> initPreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  // Retrieves all tasks stored in SharedPreferences.
  static List<TaskModel> get getTasks {
    final tasksJson = _pref.getString(_tasksKey);
    if (tasksJson == null) return [];

    final List decoded = jsonDecode(tasksJson);
    return decoded.map((e) => TaskModel.fromJson(e)).toList();
  }

  // Saves a list of tasks to SharedPreferences.
  static Future<void> saveTasks(List<TaskModel> tasks) async {
    if (tasks.isEmpty) {
      await _pref.remove(_tasksKey);
      return;
    }

    final encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await _pref.setString(_tasksKey, encoded);
  }

  // Removes a task by its id from the stored list.
  static Future<void> removeTask(String id) async {
    final currentTasks = getTasks;
    currentTasks.removeWhere((task) => task.id == id);
    await saveTasks(currentTasks);
  }

  // Updates an existing task with updatedTask data.
  static Future<void> updateTask(TaskModel updatedTask) async {
    final currentTasks = getTasks;
    final index = currentTasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      currentTasks[index] = updatedTask;
      await saveTasks(currentTasks);
    }
  }

  static Future<void> clearTasks() async {
    await _pref.remove(_tasksKey);
  }
}
