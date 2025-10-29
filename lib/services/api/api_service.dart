import 'package:dio/dio.dart';
import '../../core/config/app_config.dart';
import 'api_interceptor.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(baseUrl: AppConfig.shared.baseUrl));
    _dio.interceptors.add(ApiInterceptor());
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return _dio.get(path, queryParameters: query);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return _dio.delete(path);
  }
}