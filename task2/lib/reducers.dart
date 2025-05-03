import 'app_state.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementAction) {
    return state.copyWith(
      counter: state.counter + action.value,
      history: List.from(state.history)..add('Добавлено ${action.value}'),
    );
  } else if (action is DecrementAction) {
    return state.copyWith(
      counter: state.counter - action.value,
      history: List.from(state.history)..add('Уменьшено на ${action.value}'),
    );
  }

  return state;
}
