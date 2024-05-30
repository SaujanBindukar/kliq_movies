import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('latest')
  Future<NewsResponse> getNews();
}
