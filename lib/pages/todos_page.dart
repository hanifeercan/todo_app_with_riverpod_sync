import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Center(
        child: Text(
          'This is the Todos page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}