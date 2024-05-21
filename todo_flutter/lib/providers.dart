import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/repositories/todo_repository.dart';

final todoRepositoryProvider = Provider<ITodoRepository>((ref) {
  return TodoRepository();
});
