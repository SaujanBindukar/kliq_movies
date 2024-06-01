import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:kliq_movies/core/utils/news_category.dart';
import 'package:kliq_movies/core/utils/news_sentiment.dart';

class NewsFilterParams {
  const NewsFilterParams({
    this.category,
    this.sentiment,
  });
  final NewsCategory? category;
  final NewsSentiment? sentiment;

  NewsFilterParams copyWith({
    NewsCategory? category,
    NewsSentiment? sentiment,
  }) {
    return NewsFilterParams(
      category: category ?? this.category,
      sentiment: sentiment ?? this.sentiment,
    );
  }
}

final newsFilterController =
    StateNotifierProvider<NewsFilterController, NewsFilterParams>((ref) {
  return NewsFilterController();
});

class NewsFilterController extends StateNotifier<NewsFilterParams> {
  NewsFilterController() : super(const NewsFilterParams());

  void updateCategory({required NewsCategory category}) {
    state = state.copyWith(category: category);
  }

  void updateSentiments({required NewsSentiment sentiment}) {
    state = state.copyWith(sentiment: sentiment);
  }

  void resetvalue() {
    state = const NewsFilterParams();
  }
}

// final newsFilterProvider = StateProvider.autoDispose<NewsFilterParams>((ref) {
//   return const NewsFilterParams();
// });
