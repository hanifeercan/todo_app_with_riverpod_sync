import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_with_riverpod_sync/models/todo_model.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_search/todo_search_provider.dart';

part 'filtered_todos_provider.g.dart';

@riverpod
List<Todo> filteredTodo(FilteredTodoRef ref) {
  final todos = ref.watch(todoListProvider);
  final filter = ref.watch(todoFilterProvider);
  final search = ref.watch(todoSearchProvider);

  List<Todo> tempTodos;

  tempTodos = switch(filter){
    Filter.all => todos,
    Filter.active => todos.where((todo) => !todo.isCompleted).toList(),
    Filter.completed => todos.where((todo) => todo.isCompleted).toList(),
  };

  if(search.isNotEmpty){
    tempTodos = tempTodos.where((todo) => todo.description.toLowerCase().contains(search.toLowerCase())).toList();
  }
  return tempTodos;
}