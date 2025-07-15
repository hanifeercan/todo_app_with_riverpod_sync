import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  ConsumerState<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(
        labelText: 'What to do?',
      ),
      onSubmitted: (String? description) {
        if (description != null && description.trim().isNotEmpty) {
          ref.read(todoListProvider.notifier).addTodo(description);
          newTodoController.clear();
        }
      },
      );
  }
}