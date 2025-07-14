import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.freezed.dart';

Uuid uuid = const Uuid();

@freezed
abstract class Todo with _$Todo{
  const factory Todo(
    {
      required String id,
      required String description,
      @Default(false) bool isCompleted,
    }
  ) = _Todo;

  factory Todo.add({required String description}) {
    return Todo(
      id: uuid.v4(),
      description: description,
    );
  }
}

enum Filter {
  all,
  active,
  completed,
}