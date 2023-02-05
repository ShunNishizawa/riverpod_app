import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void add(Todo todo) {
    state = [...state, todo];
  }

  // IDを指定して、Todoを削除するメソッド
  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo,
    ];
  }

  /// IDを指定して、TODOの完了状態を切り替えるメソッド
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}
