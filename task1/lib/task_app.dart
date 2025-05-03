import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'task_store.dart';

class TaskApp extends StatelessWidget {
  final TaskStore store = TaskStore();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Мои задачи')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Добавить задачу',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      store.addTask(controller.text);
                      controller.clear();
                    },
                  ),
                ),
              ),
            ),
            Observer(
              builder: (_) => Text('Всего задач: ${store.taskCount}'),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: store.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(store.tasks[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          store.removeTask(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
