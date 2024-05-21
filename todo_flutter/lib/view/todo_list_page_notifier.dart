import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers.dart';
import 'package:todo_flutter/repositories/todo_repository.dart';
import 'package:todo_flutter/view/todo_list_page_state.dart';

final todoListPageNotifierProvider =
    StateNotifierProvider<TodoListPageNotifier, TodoListPageState>(
  TodoListPageNotifier.new,
);

class TodoListPageNotifier extends StateNotifier<TodoListPageState> {
  TodoListPageNotifier(this._ref)
      : super(
          const TodoListPageState(),
        );
  final Ref _ref;
  ITodoRepository get _todoRepository => _ref.read(todoRepositoryProvider);
  Future<void> getTodos() async {
    state = state.copyWith(
      todos: const AsyncLoading(),
    );

    final todos = await AsyncValue.guard<List<Todo>>(
      () async => await _todoRepository.getTodos(),
    );
    state = state.copyWith(
      todos: todos,
    );
  }
}
