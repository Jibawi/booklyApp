import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout ');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout ');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout ');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Invalid certificate ');
      case DioExceptionType.badResponse:
        return ServerFailure(
          'Bad response from server: ${dioError.response?.statusCode} ${dioError.response?.statusMessage}',
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection :(');
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
          'Unknown error occurred: ${dioError.message}',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        response['error']?['message'] ??
            'Authentication or Authorization error',
      );
    } else if (statusCode == 404) {
      return const ServerFailure(
          "Your request was not found. Please try again.");
    } else if (statusCode == 500) {
      return const ServerFailure(
          "Internal Server Error. Please try again later.");
    } else {
      return const ServerFailure(
          "An unexpected error occurred. Please try again.");
    }
  }
}
