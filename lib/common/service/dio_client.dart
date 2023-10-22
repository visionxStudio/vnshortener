import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:likhitexam/common/service/exceptions/network_exceptions.dart';
import 'package:likhitexam/common/service/shared_pref_provider.dart';

class DioClient {
  DioClient._() {
    _setupDio();
  }
  final Dio _dio = Dio();

  static final DioClient _instance = DioClient._();
  static DioClient get instance => _instance;
  final base = "";

  // invironment flavour

  void _setupDio() {
    _dio.options = BaseOptions(
      baseUrl: base,
      headers: {
        'accept': 'application/json',
        'contentType': 'application/json',
      },
    );

    final storage = SharedPrefProvider.instance();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
          // locking dio before reading token from storage
          // ignore: deprecated_member_use
          _dio.lock();
          final token = storage.getString('token');
          final isCoach = storage.getBool('isCoach') ?? false;
          debugPrint("Bearer $token");
          // ignore: deprecated_member_use
          _dio.unlock();
          // add authorization token if it is not null
          if (token != null) {
            debugPrint(token);

            options.headers["Authorization"] = "Bearer $token";
            options.headers["user-type"] = isCoach ? 'coach' : 'client';
            // slack.send(options.headers.toString());
          }
          // continue the operation
          r.next(options);
        },
        // onResponse:
        // onResponse: (Response response , Response )
      ),
    );
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<Response> post(uri,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      Function(int count, int total)? onSendProgress}) async {
    try {
      final response = await _dio.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress);
      return response;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  Future<void> download(String urlPath, String filePath) async {
    try {
      await Dio().download(urlPath, filePath);
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }

  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    }
  }
}
