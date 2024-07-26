import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo_flutter/api.dart';
import 'package:todo_flutter/app_dio.dart';
import 'package:todo_flutter/models/todo.dart';
import 'package:todo_flutter/providers.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> createTodo(Todo todo);
  Future<Todo> updateTodo(
    Todo todo,
  );
  Future<void> deleteTodo(
    int id,
  );
}

class TodoRepository implements ITodoRepository {
  TodoRepository(this._ref);
  final Ref _ref;
  AppDio get appDio => _ref.read(appDioProvider);
  @override
  Future<List<Todo>> getTodos() async {
    try {
      final api = Api(appDio);
      final todos = await api.getTodos();
      SimpleLogger().info('todos: $todos');
      return todos;
    } on DioException catch (e) {
      final response = e.response;
      SimpleLogger().shout(
        'statusCode: ${response?.statusCode}, '
        'message: ${response?.statusMessage}'
        'data: ${response?.data}',
      );
      rethrow;
    } catch (e, stack) {
      SimpleLogger().shout({
        'message': e.toString(),
        'stack': stack.toString(),
      });
      rethrow;
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    final api = Api(appDio);
    final createdTodo = await api.createTodo(todo);
    return createdTodo;
  }

  @override
  Future<Todo> updateTodo(
    Todo todo,
  ) async {
    final api = Api(appDio);
    final updatedTodo = await api.updateTodo(
      todo.id,
      todo,
    );
    return updatedTodo;
  }

  @override
  Future<void> deleteTodo(
    int id,
  ) async {
    final api = Api(appDio);
    await api.deleteTodo(id);
  }
}
