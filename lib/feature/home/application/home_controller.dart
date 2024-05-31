import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/favourite/application/favourite_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';
import 'package:kliq_movies/feature/home/infrastructure/repository/home_repository.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, BaseState<NewsResponse>>((ref) {
  return HomeController(ref: ref)..getNews();
});

class HomeController extends StateNotifier<BaseState<NewsResponse>> {
  final Ref ref;
  HomeController({
    required this.ref,
  }) : super(
          const BaseState.initial(),
        );
  IHomeRepository get _homeRepository => ref.read(homeRepositoryProvider);

  Future<void> getNews() async {
    state = const BaseState.loading();
    final response = await _homeRepository.getNews();
    state = response.fold(
      (failure) => BaseState.error(failure),
      (success) => BaseState.success(data: success),
    );
  }

  Future<void> favouriteNews({
    required News news,
  }) async {
    if (state is BaseSuccess) {
      final data = (state as BaseSuccess);
      final newsResponse = data.data as NewsResponse;
      final newsList = [...newsResponse.results];
      final index = newsList.indexOf(news);
      if (index >= 0) {
        newsList[index] = newsList[index].copyWith(
          isFavourite: !newsList[index].isFavourite,
        );
      }
      await ref.read(favouriteControllerProvider.notifier).addFavouriteNews(
            news: news,
          );
      state = BaseSuccess(
        data: newsResponse.copyWith(results: newsList),
      );
    }
  }
}
