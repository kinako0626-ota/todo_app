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

  Future<void> updateTodo({
    required Todo todo,
  }) async {
    final previusTodos = state.todos.asData?.value ?? [];
    final updatedTodo = await AsyncValue.guard<Todo>(
      () async => await _todoRepository.updateTodo(
        todo,
      ),
    );
    final generatedTodos = previusTodos.map(
      (e) {
        if (e.id == updatedTodo.asData?.value.id) {
          return updatedTodo.asData?.value ?? e;
        }
        return e;
      },
    ).toList();
    state = state.copyWith(
      todos: AsyncValue.data(generatedTodos),
    );
  }

  Future<void> createTodo({
    required Todo todo,
  }) async {
    final previusTodos = state.todos.asData?.value ?? [];
    state = state.copyWith(
      todos: const AsyncLoading(),
    );
    final createdTodo = await AsyncValue.guard<Todo>(
      () async => await _todoRepository.createTodo(
        todo,
      ),
    );
    createdTodo.whenData((value) {
      final generatedTodos = [...previusTodos, value];
      state = state.copyWith(
        todos: AsyncValue.data(generatedTodos),
      );
    });
  }

  Future<void> deleteTodo({
    required int id,
  }) async {
    final previusTodos = state.todos.asData?.value ?? [];
    state = state.copyWith(
      todos: const AsyncLoading(),
    );
    await AsyncValue.guard<void>(
      () async => await _todoRepository.deleteTodo(
        id,
      ),
    );
    final generatedTodos = previusTodos
        .where(
          (e) => e.id != id,
        )
        .toList();
    state = state.copyWith(
      todos: AsyncValue.data(generatedTodos),
    );
  }
}
