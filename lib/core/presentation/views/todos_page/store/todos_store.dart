import 'package:injectable/injectable.dart';
import 'package:m_one_task/core/data/models/task_model.dart';
import 'package:m_one_task/core/data/usecases/task_data/clear_tasks_usecase.dart';
import 'package:m_one_task/core/data/usecases/task_data/get_tasks_usecase.dart';
import 'package:m_one_task/core/data/usecases/task_data/remove_task_usecase.dart';
import 'package:m_one_task/core/data/usecases/task_data/save_tasks_usecase.dart';
import 'package:m_one_task/core/data/usecases/task_data/update_tasks_usecase.dart';
import 'package:m_one_task/core/data/utilities/filters_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'todos_store.g.dart';

@injectable
class TodosStore = _TodosStore with _$TodosStore;

abstract class _TodosStore with Store {
  final GetTasksUseCase getTasksUseCase;
  final SaveTasksUseCase saveTasksUseCase;
  final ClearTasksUseCase clearTasksUseCase;
  final UpdateTasksUsecase updateTasksUseCase;
  final RemoveTaskUsecase removeTaskUsecase;

  _TodosStore(
    this.getTasksUseCase,
    this.saveTasksUseCase,
    this.clearTasksUseCase,
    this.updateTasksUseCase,
    this.removeTaskUsecase,
  ) {
    loadTasks();
  }

  @observable
  ObservableList<TaskModel> tasks = ObservableList<TaskModel>();

  @observable
  Filter filter = Filter.all;

  @action
  Future<void> loadTasks() async {
    final loadedTasks = await getTasksUseCase();
    tasks = ObservableList.of(loadedTasks);
  }

  @action
  void setFilter(Filter newFilter) => filter = newFilter;

  @computed
  List<TaskModel> get filteredTasks {
    switch (filter) {
      case Filter.active:
        return tasks.where((t) => !t.completed).toList();
      case Filter.completed:
        return tasks.where((t) => t.completed).toList();
      default:
        return tasks.toList();
    }
  }

  @action
  void toggleComplete(TaskModel task) {
    final updated = task.copyWith(completed: !task.completed);
    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = updated;
    updateTasksUseCase(updated);
  }

  @action
  Future<void> addTask(String title, String description) async {
    tasks.add(
      TaskModel(
        id: Uuid().v4(),
        title: title,
        description: description,
        completed: false,
      ),
    );
    await saveTasksUseCase(tasks.toList());
  }

  @action
  Future<void> removeTask(String id) async {
    tasks.removeWhere((t) => t.id == id);
    await removeTaskUsecase(id);
  }

  @action
  Future<void> clearAllTasks() async {
    tasks.clear();
    await clearTasksUseCase();
  }
}
