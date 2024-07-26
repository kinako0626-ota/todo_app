import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_flutter/app_dio.dart';
import 'package:todo_flutter/constants.dart';
import 'package:todo_flutter/models/todo.dart';

part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class Api {
  factory Api(AppDio dio, {String baseUrl}) = _Api;

  @GET('/')
  Future<List<Todo>> getTodos();

  @POST('/todos')
  Future<Todo> createTodo(
    @Body() Todo todo,
  );

  @PUT('/{id}')
  Future<Todo> updateTodo(
    @Path('id') int id,
    @Body() Todo todo,
  );

  @DELETE('/todos/{id}')
  Future<void> deleteTodo(
    @Path('id') int id,
  );
}
