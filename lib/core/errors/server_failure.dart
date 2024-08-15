import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_bookly/core/errors/failure.dart';

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
        return ServerFailure('Unexpected Error, Pleas try again');

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

  factory ServerFailure.fromAuthFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return ServerFailure(
          'The password provided is too weak',
        );
      case 'email-already-in-use':
        return ServerFailure(
          'The account already exists for that email',
        );
      case 'user-not-found':
        return ServerFailure(
          'No user found for that email',
        );
      case 'wrong-password':
        return ServerFailure(
          'Wrong password provided for that user',
        );
      case 'network-request-failed':
        return ServerFailure(
          'Make sure you are connected to the internet',
        );
      case 'account-exists-with-different-credential':
        return ServerFailure(
          'An account already exists with a different credential',
        );
      case 'invalid-credential':
        return ServerFailure(
          'You don\'t have an account with that credential',
        );
      case 'too-many-requests':
        return ServerFailure(
          'Too many requests, Try again later',
        );
      case 'invalid-phone-number':
        return ServerFailure(
          'Invalid phone number',
        );

      case 'requires-recent-login':
        return ServerFailure(
          'Please re_authenticate by logging in again to perform this action',
        );

      default:
        return ServerFailure(
          'An error accurred, Please try again',
        );
    }
  }
}
