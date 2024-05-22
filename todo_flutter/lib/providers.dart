import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter/app_dio.dart';
import 'package:todo_flutter/repositories/todo_repository.dart';

final todoRepositoryProvider = Provider<ITodoRepository>(
  TodoRepository.new,
);

final appDioProvider = Provider<AppDio>(
  (_) => AppDio(),
);
