// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoListPageState {
  AsyncValue<List<Todo>> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListPageStateCopyWith<TodoListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListPageStateCopyWith<$Res> {
  factory $TodoListPageStateCopyWith(
          TodoListPageState value, $Res Function(TodoListPageState) then) =
      _$TodoListPageStateCopyWithImpl<$Res, TodoListPageState>;
  @useResult
  $Res call({AsyncValue<List<Todo>> todos});
}

/// @nodoc
class _$TodoListPageStateCopyWithImpl<$Res, $Val extends TodoListPageState>
    implements $TodoListPageStateCopyWith<$Res> {
  _$TodoListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Todo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoListPageStateImplCopyWith<$Res>
    implements $TodoListPageStateCopyWith<$Res> {
  factory _$$TodoListPageStateImplCopyWith(_$TodoListPageStateImpl value,
          $Res Function(_$TodoListPageStateImpl) then) =
      __$$TodoListPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<Todo>> todos});
}

/// @nodoc
class __$$TodoListPageStateImplCopyWithImpl<$Res>
    extends _$TodoListPageStateCopyWithImpl<$Res, _$TodoListPageStateImpl>
    implements _$$TodoListPageStateImplCopyWith<$Res> {
  __$$TodoListPageStateImplCopyWithImpl(_$TodoListPageStateImpl _value,
      $Res Function(_$TodoListPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
  }) {
    return _then(_$TodoListPageStateImpl(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Todo>>,
    ));
  }
}

/// @nodoc

class _$TodoListPageStateImpl implements _TodoListPageState {
  const _$TodoListPageStateImpl({this.todos = const AsyncData(<Todo>[])});

  @override
  @JsonKey()
  final AsyncValue<List<Todo>> todos;

  @override
  String toString() {
    return 'TodoListPageState(todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListPageStateImpl &&
            (identical(other.todos, todos) || other.todos == todos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListPageStateImplCopyWith<_$TodoListPageStateImpl> get copyWith =>
      __$$TodoListPageStateImplCopyWithImpl<_$TodoListPageStateImpl>(
          this, _$identity);
}

abstract class _TodoListPageState implements TodoListPageState {
  const factory _TodoListPageState({final AsyncValue<List<Todo>> todos}) =
      _$TodoListPageStateImpl;

  @override
  AsyncValue<List<Todo>> get todos;
  @override
  @JsonKey(ignore: true)
  _$$TodoListPageStateImplCopyWith<_$TodoListPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
