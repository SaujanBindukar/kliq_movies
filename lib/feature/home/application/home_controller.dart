import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/home/infrastructure/repository/home_repository.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, BaseState>((ref) {
  return HomeController(ref: ref)..getNews();
});

class HomeController extends StateNotifier<BaseState> {
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
}
