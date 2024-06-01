import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/retrofit/api_services.dart';
import 'package:kliq_movies/core/app_setup/retrofit/interceptor.dart/error_interceptors.dart';
import 'package:kliq_movies/core/app_setup/retrofit/interceptor.dart/request_interceptors.dart';
import 'package:kliq_movies/core/app_setup/retrofit/interceptor.dart/response_interceptors.dart';

final baseUrlProvider = Provider<String>((ref) => 'https://newsdata.io/api/1/');

final dioProvider = Provider<ApiServices>((ref) {
  final dio = Dio();

  final baseUrl = ref.watch(baseUrlProvider);
  final apiKey = dotenv.env['API_KEY'];

  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30); //30 sec
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.options.contentType = Headers.jsonContentType;
  dio.options.queryParameters = {
    'apikey': apiKey,
  };
  dio.options.headers = <String, dynamic>{
    'Accept': Headers.jsonContentType,
  };
  dio.options.extra = <String, Object>{};

  dio.interceptors.addAll([
    ///handles the logs
    LogInterceptor(),

    ///handles the request
    RequestInterceptors(ref: ref),

    //handle the response from the API
    ResponseInterceptors(),

    //handles the error
    ErrorInterceptors(ref: ref),
  ]);
  return ApiServices(dio);
});
