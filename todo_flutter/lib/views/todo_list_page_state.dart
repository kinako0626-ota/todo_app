import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/models/todo.dart';

part 'todo_list_page_state.freezed.dart';

@freezed
class TodoListPageState with _$TodoListPageState {
  const factory TodoListPageState({
    @Default(AsyncData(<Todo>[])) AsyncValue<List<Todo>> todos,
  }) = _TodoListPageState;
}
