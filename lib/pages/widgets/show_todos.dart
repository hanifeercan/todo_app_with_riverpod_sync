import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';

class ShowTodos extends ConsumerWidget{
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filteredTodos = ref.watch(filteredTodoProvider);
    return ListView.separated(
      itemCount: filteredTodos.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey),
      itemBuilder: (BuildContext context, int index) {
        final todo = filteredTodos[index];
        return Text(todo.description,style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}