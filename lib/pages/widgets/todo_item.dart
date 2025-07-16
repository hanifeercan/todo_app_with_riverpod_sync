import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod_sync/models/todo_model.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: (){
        showDialog(context: context,
        builder: (context){
          return ConfirmEditDialog(todo: todo);
        });
      },
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? checked) {
          ref.read(todoListProvider.notifier).toggleTodo(todo.id);
        },
      ),
      title: Text(todo.description),
      trailing: IconButton(
        onPressed: () async {
        final removeOrNot = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return AlertDialog(
              title: const Text('Delete Todo'),
              content: Text('Are you sure you want to delete "${todo.description}"?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
          );
          if(removeOrNot){
            ref.read(todoListProvider.notifier).removeTodo(todo.id);
          }
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}

class ConfirmEditDialog extends ConsumerStatefulWidget {
  final Todo todo;

  const ConfirmEditDialog({super.key, required this.todo});

  @override
  ConsumerState<ConfirmEditDialog> createState() => _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends ConsumerState<ConfirmEditDialog> {
  late final TextEditingController _controller;
  bool error = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.todo.description);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
         errorText: error ? 'value cannot be empty' : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            error = _controller.text.isEmpty ? true : false;
            if (error) {
              setState(() {});
            } else {
               ref
                    .read(todoListProvider.notifier)
                    .editTodo(widget.todo.id, _controller.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
  );
  }
}