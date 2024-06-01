import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  ErrorInterceptors({
    required this.ref,
  });
  Ref ref;
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      ///Logout from here
    }
    super.onError(err, handler);
  }
}
