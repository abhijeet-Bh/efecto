import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'auth_data_box.dart';
import 'constants.dart';

class NetworkConfig {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
    ),
  );

  Dio get dio => _dio;

  // Authenticated Endpoints

  Future<Response<T>> getAuthenticated<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      // Add your authentication logic here if needed
      _dio.options.headers['Authorization'] =
          'Bearer ${AuthTokenBox.accessToken}';

      final response =
          await _dio.get<T>(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response<T>> postAuthenticated<T>(String path, dynamic data) async {
    try {
      // Add your authentication logic here if needed
      _dio.options.headers['Authorization'] =
          'Bearer ${AuthTokenBox.accessToken}';

      final response = await _dio.post<T>(path, data: data);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Non-authenticated Endpoints

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get<T>(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response<T>> post<T>(String path, dynamic data) async {
    try {
      final response = await _dio.post<T>(path, data: data);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Add more methods for other HTTP methods as needed (put, patch, delete, etc.)

  // Error handling
  dynamic _handleError(dynamic error) {
    if (error is DioException) {
      // Handle DioErrors here
      debugPrint('DioError: $error');
      throw error;
    } else {
      // Handle other types of errors here
      debugPrint('Error: $error');
      throw error;
    }
  }
}
