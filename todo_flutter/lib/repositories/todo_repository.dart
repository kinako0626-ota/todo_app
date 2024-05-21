import 'package:dio/dio.dart';
import 'package:todo_flutter/api.dart';
import 'package:todo_flutter/models/todo.dart';

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
  @override
  Future<List<Todo>> getTodos() async {
    Dio dio = Dio();
    Api api = Api(dio);
    final todos = await api.getTodos();
    return todos;
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    Dio dio = Dio();
    Api api = Api(dio);
    final createdTodo = await api.createTodo(todo);
    return createdTodo;
  }

  @override
  Future<Todo> updateTodo(
    Todo todo,
  ) async {
    Dio dio = Dio();
    Api api = Api(dio);
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
    Dio dio = Dio();
    Api api = Api(dio);
    await api.deleteTodo(id);
  }
}
