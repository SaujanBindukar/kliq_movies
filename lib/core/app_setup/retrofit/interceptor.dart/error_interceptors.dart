import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  Ref ref;
  ErrorInterceptors({
    required this.ref,
  });
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // ref
      //     .read(appNotifierProvider.notifier)
      //     .updateAppState(const AppState.unAuthenticated(isSignIn: true));
    }
    super.onError(err, handler);
  }
}
