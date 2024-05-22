import 'package:dio/dio.dart';
import 'package:todo_flutter/constants.dart';

class AppDio extends DioMixin {
  factory AppDio() {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }
    final dio = AppDio._();
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30), // タイムアウトを30秒に延長
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Origin': baseUrl,
      },
      contentType: 'application/json',
    );
    dio
      ..options = options
      ..httpClientAdapter = HttpClientAdapter();
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _instance = dio;
    return dio;
  }

  AppDio._();

  static AppDio? _instance;
}
