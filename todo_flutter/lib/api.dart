import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_flutter/models/todo.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'http://localhost:8080')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/todos')
  Future<List<Todo>> getTodos();

  @POST('/todos')
  Future<Todo> createTodo(
    @Body() Todo todo,
  );

  @PUT('/todos/{id}')
  Future<Todo> updateTodo(
    @Path('id') int id,
    @Body() Todo todo,
  );

  @DELETE('/todos/{id}')
  Future<void> deleteTodo(
    @Path('id') int id,
  );
}
