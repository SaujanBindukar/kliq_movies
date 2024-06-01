import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/failure/failure.dart';

import 'package:kliq_movies/core/app_setup/retrofit/api_services.dart';
import 'package:kliq_movies/core/app_setup/retrofit/retrofit_client.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

final homeRepositoryProvider = Provider<IHomeRepository>((ref) {
  return HomeRepository(ref: ref);
});

abstract class IHomeRepository {
  Future<Either<Failure, NewsResponse>> getNews({
    String? category,
    String? sentiment,
  });
}

class HomeRepository implements IHomeRepository {
  HomeRepository({
    required this.ref,
  });
  final Ref ref;
  ApiServices get _retroFit => ref.read(dioProvider);
  @override
  Future<Either<Failure, NewsResponse>> getNews({
    String? category,
    String? sentiment,
  }) async {
    try {
      final response = await _retroFit.getNews(
        langugage: 'en',
        category: category,
        sentiment: sentiment,
        image: 1,
      );
      return Right(response);
    } on DioException catch (error) {
      return Left(error.toFailure);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
