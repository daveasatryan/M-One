// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodosStore on _TodosStore, Store {
  Computed<List<TaskModel>>? _$filteredTasksComputed;

  @override
  List<TaskModel> get filteredTasks =>
      (_$filteredTasksComputed ??= Computed<List<TaskModel>>(
        () => super.filteredTasks,
        name: '_TodosStore.filteredTasks',
      )).value;

  late final _$tasksAtom = Atom(name: '_TodosStore.tasks', context: context);

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$filterAtom = Atom(name: '_TodosStore.filter', context: context);

  @override
  Filter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Filter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$loadTasksAsyncAction = AsyncAction(
    '_TodosStore.loadTasks',
    context: context,
  );

  @override
  Future<void> loadTasks() {
    return _$loadTasksAsyncAction.run(() => super.loadTasks());
  }

  late final _$addTaskAsyncAction = AsyncAction(
    '_TodosStore.addTask',
    context: context,
  );

  @override
  Future<void> addTask(String title, String description) {
    return _$addTaskAsyncAction.run(() => super.addTask(title, description));
  }

  late final _$removeTaskAsyncAction = AsyncAction(
    '_TodosStore.removeTask',
    context: context,
  );

  @override
  Future<void> removeTask(String id) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(id));
  }

  late final _$clearAllTasksAsyncAction = AsyncAction(
    '_TodosStore.clearAllTasks',
    context: context,
  );

  @override
  Future<void> clearAllTasks() {
    return _$clearAllTasksAsyncAction.run(() => super.clearAllTasks());
  }

  late final _$_TodosStoreActionController = ActionController(
    name: '_TodosStore',
    context: context,
  );

  @override
  void setFilter(Filter newFilter) {
    final _$actionInfo = _$_TodosStoreActionController.startAction(
      name: '_TodosStore.setFilter',
    );
    try {
      return super.setFilter(newFilter);
    } finally {
      _$_TodosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleComplete(TaskModel task) {
    final _$actionInfo = _$_TodosStoreActionController.startAction(
      name: '_TodosStore.toggleComplete',
    );
    try {
      return super.toggleComplete(task);
    } finally {
      _$_TodosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
filter: ${filter},
filteredTasks: ${filteredTasks}
    ''';
  }
}
