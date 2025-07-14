import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_with_riverpod_sync/models/todo_model.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [
      const Todo(
        id: '1',
        description: 'Buy groceries',
      ),
      const Todo(
        id: '2',
        description: 'Walk the dog',
      ),
      const Todo(
        id: '3',
        description: 'Read a book',
      ),
    ];
  }

  void addTodo(String description) {
    final newTodo = Todo.add(description: description);
    state = [...state, newTodo];
  }

  void editTodo(String id, String description) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(description: description)
        else
          todo,
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void removeTodo(String id) {
    state = [for (final todo in state) if (todo.id != id) todo];
  }
}