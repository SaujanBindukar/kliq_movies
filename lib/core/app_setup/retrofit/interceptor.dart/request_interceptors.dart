import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestInterceptors extends InterceptorsWrapper {
  RequestInterceptors({
    required this.ref,
  });
  Ref ref;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);
  }
}
