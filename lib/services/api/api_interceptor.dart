import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = PreferencesService.getToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    debugPrint('➡️ [${options.method}] ${options.path}');
    debugPrint('Body: ${options.data}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ Response [${response.statusCode}] ${response.requestOptions.path}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ Error [${err.response?.statusCode}] ${err.requestOptions.path}');
    return handler.next(err);
  }
}