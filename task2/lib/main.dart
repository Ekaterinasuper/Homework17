import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';
import 'reducers.dart';
import 'actions.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Counter',
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Счетчик')),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (context, viewModel) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Текущее значение: ${viewModel.counter}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => viewModel.increment(),
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => viewModel.decrement(),
                child: Text('-'),
              ),
              SizedBox(height: 20),
              Text('Общее количество операций: ${viewModel.history.length}'),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(viewModel.history[index]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final int counter;
  final List<String> history;
  final Function() increment;
  final Function() decrement;

  _ViewModel({
    required this.counter,
    required this.history,
    required this.increment,
    required this.decrement,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      counter: store.state.counter,
      history: store.state.history,
      increment: () => store.dispatch(IncrementAction(1)),
      decrement: () => store.dispatch(DecrementAction(1)),
    );
  }
}
