import 'package:dio/dio.dart';
import 'package:kliq_movies/core/app_setup/retrofit/app_endpoint.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiEndpoint.latestMovies)
  Future<NewsResponse> getNews({
    @Query('language') required String langugage,
    @Query('category') String? category,
    @Query('q') String? query,
    @Query('image') required int image,
    @Query('page') String? page,
  });
}
