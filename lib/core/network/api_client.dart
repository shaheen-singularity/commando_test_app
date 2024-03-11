import 'dart:io';
import 'package:commando_test_app/core/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'api_exception.dart';

const _defaultConnectTimeout = Duration(minutes: 1);
const _defaultReceiveTimeout = Duration(minutes: 1);

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: _defaultConnectTimeout,
        receiveTimeout: _defaultReceiveTimeout,
        headers: {
          "Accept": "application/json"
        }
    ));
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true));
    }

    //handshake exception handshake error in client dio
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }

  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response<dynamic>> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }
}