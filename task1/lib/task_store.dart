import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @computed
  int get taskCount => tasks.length;

  @action
  void addTask(String task) {
    if (task.isNotEmpty) {
      tasks.add(task);
    }
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
