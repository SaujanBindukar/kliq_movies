import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestInterceptors extends InterceptorsWrapper {
  Ref ref;
  RequestInterceptors({
    required this.ref,
  });
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters = {
      'apikey': 'pub_45104daf12d9ee0c8bbdded605d6590c54ee4',
      'language': 'en'
    };
    super.onRequest(options, handler);
  }
}
