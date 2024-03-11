import 'package:dio/dio.dart';

class ApiException implements Exception {
  late String errorMessage;

  ApiException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') == true) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode, dynamic) {
    switch (statusCode) {
      case 400:
        return dynamic['app_message'] ?? 'Bad request.';
      case 401:
        return dynamic['app_message'] ?? 'Authentication failed.';
      case 403:
        return dynamic['app_message'] ?? 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return dynamic['app_message'] ?? 'The requested resource does not exist.';
      case 405:
        return dynamic['app_message'] ?? 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return dynamic['app_message'] ?? 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return dynamic['app_message'] == null ? (dynamic['message'] ?? 'Data validation failed.') : 'Data validation failed.';
      case 429:
        return dynamic['app_message'] ?? 'Too many requests.';
      case 500:
        return dynamic['app_message'] ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}