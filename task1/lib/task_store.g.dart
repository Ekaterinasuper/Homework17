// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  Computed<int>? _$taskCountComputed;

  @override
  int get taskCount => (_$taskCountComputed ??=
          Computed<int>(() => super.taskCount, name: '_TaskStore.taskCount'))
      .value;

  late final _$tasksAtom = Atom(name: '_TaskStore.tasks', context: context);

  @override
  ObservableList<String> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<String> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void addTask(String task) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
taskCount: ${taskCount}
    ''';
  }
}
