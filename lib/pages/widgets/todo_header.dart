import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/active_todo_count/active_todo_count_provider.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final activeTodoCount = ref.watch(activeTodoCountProvider);
  final todoList = ref.watch(todoListProvider);
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Todos',
              style: TextStyle(
                fontSize: 36,
            ),
            ),
            SizedBox(width: 10),
            Text(
              '($activeTodoCount/${todoList.length} item${activeTodoCount != 1? "s" : ""} left)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[900],
              ),
            )
          ],
        ),
        IconButton(onPressed: (){
          ref.read(themeProvider.notifier).toogleTheme();
        }, icon: const Icon(Icons.light_mode)),
      ],
    );
  }
}