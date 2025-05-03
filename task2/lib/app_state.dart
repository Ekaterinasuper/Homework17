class AppState {
  final int counter;
  final List<String> history;

  AppState({this.counter = 0, this.history = const []});

  AppState copyWith({int? counter, List<String>? history}) {
    return AppState(
      counter: counter ?? this.counter,
      history: history ?? this.history,
    );
  }
}
