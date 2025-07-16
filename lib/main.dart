import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:todo_app_with_riverpod_sync/pages/todos_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentTheme = ref.watch(themeProvider);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: currentTheme == AppTheme.light ? ThemeData.light(useMaterial3: true): ThemeData.dark(useMaterial3: true),
      home: const TodosPage(),
    );
  }
}