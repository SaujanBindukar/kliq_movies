import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/favourite/infrastructure/repository/favourite_repository.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

final favouriteControllerProvider =
    StateNotifierProvider<FavouriteController, BaseState<List<News>>>((ref) {
  return FavouriteController(ref: ref);
});

class FavouriteController extends StateNotifier<BaseState<List<News>>> {
  Ref ref;
  FavouriteController({
    required this.ref,
  }) : super(const BaseState.initial());

  IFavouriteRepository get favouriteRepository =>
      ref.read(favouriteRepositoryProvider);

  Future<void> getFavouriteNews() async {
    state = const BaseState.loading();
    final response = await favouriteRepository.getFavouriteNews();
    await Future.delayed(const Duration(seconds: 0));
    state = BaseState.success(data: response);
  }

  Future<void> addFavouriteNews({required News news}) async {
    final localData = await favouriteRepository.getFavouriteNews();
    List<News> localList = List.from(localData);
    if (localList.contains(news)) {
      localList.remove(news);
    } else {
      localList = [...localList, news.copyWith(isFavourite: true)];
    }
    await favouriteRepository.cacheFavouriteMovies(news: localList);
    state = BaseState.success(data: localList);
  }
}
