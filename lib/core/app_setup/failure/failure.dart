import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class Failure {
  Failure(this.reason, this.type, [this.code]);

  factory Failure.fromException(Object e) => Failure(
        e.toString(),
        FailureType.exception,
      );
  final String reason;
  final FailureType type;
  final int? code;
}

extension DioErrorExtension on DioException {
  Failure get toFailure {
    _logError(this);

    var msg = message ?? 'Something went wrong';
    if (response?.statusCode == 400 && response?.data != null) {
      final data = response!.data as Map<String, dynamic>;

      ///can be change acc to API failure message
      final m = data['msg'] as String?;
      if (m?.isNotEmpty ?? false) {
        msg = m!;
      }
    }

    switch (type) {
      case DioExceptionType.cancel:
        return Failure(
          msg,
          FailureType.cancel,
        );
      case DioExceptionType.connectionTimeout:
        return Failure(
          msg,
          FailureType.requestTimeout,
        );
      case DioExceptionType.receiveTimeout:
        return Failure(
          msg,
          FailureType.responseTimeout,
        );
      case DioExceptionType.badResponse:
        return Failure(
          msg,
          FailureType.response,
          response?.statusCode ?? FailureType.response.code,
        );
      default:
        if (error.runtimeType == SocketException) {
          return Failure(
            'No internet! Please check your connection..',
            FailureType.internet,
            response?.statusCode ?? FailureType.internet.code,
          );
        }
        return Failure(
          msg,
          FailureType.unknown,
          response?.statusCode ?? FailureType.unknown.code,
        );
    }
  }
}

class FailureType {
  const FailureType._internal(this.code);

  final int code;

  static const FailureType authentication = FailureType._internal(-4);

  static const FailureType exception = FailureType._internal(-3);

  static const FailureType unknown = FailureType._internal(-2);

  static const FailureType internet = FailureType._internal(-1);

  static const FailureType cancel = FailureType._internal(0);

  static const FailureType requestTimeout = FailureType._internal(408);

  static const FailureType responseTimeout = FailureType._internal(598);

  static const FailureType response = FailureType._internal(400);

  static const List<FailureType> values = [
    FailureType.authentication,
    FailureType.exception,
    FailureType.unknown,
    FailureType.cancel,
    FailureType.requestTimeout,
    FailureType.responseTimeout,
    FailureType.response,
  ];
}

void _logError(DioException error) {
  log('''
    ERROR       :     ${error.error}\n
    MESSAGE     :     ${error.message}\n
    TYPE        :     ${error.type}\n
    DATA        :     ${error.response?.data}\n
    URI         :     ${error.response?.realUri}\n
    STATUS      :     ${error.response?.statusCode}\n
  ''');
}
