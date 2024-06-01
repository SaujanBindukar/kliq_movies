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
    options.queryParameters = {
      'apikey': 'pub_45104daf12d9ee0c8bbdded605d6590c54ee4',
    };
    super.onRequest(options, handler);
  }
}
