import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            "The server certificate is not trusted. Please check your connection and try again.");

      case DioExceptionType.connectionError:
        return ServerFailure(
            "There seems to be a connection error. Please check your internet connection and try again.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Pleas try again');
        }
      default:
        return ServerFailure('Opps there was an error, pleas try again');
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found, pleas try later');
    } else if (statuscode == 500) {
      return ServerFailure('Internal Server error, pleas try later');
    } else {
      return ServerFailure('Opps there was an error, pleas try again');
    }
  }
}
