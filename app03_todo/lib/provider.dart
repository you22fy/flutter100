import 'package:app03_todo/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider =
    StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList());

class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  void add(String title) {
    state = [
      ...state,
      Todo(
        id: DateTime.now().toString(),
        title: title,
      ),
    ];
  }

  void remove(Todo todo) {
    state = state.where((item) => item.id != todo.id).toList();
  }

  void toggle(String id) {
    state = state
        .map((todo) =>
            todo.id == id ? todo.copyWith(completed: !todo.completed) : todo)
        .toList();
  }
}
