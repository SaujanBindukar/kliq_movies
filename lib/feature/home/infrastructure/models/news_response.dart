import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_response.freezed.dart';

part 'news_response.g.dart';

@freezed
class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    required String status,
    required int totalResults,
    @Default([]) List<News> results,
  }) = _NewsResponse;
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@freezed
class News with _$News {
  const factory News({
    @JsonKey(name: 'article_id') required String articleId,
    required String title,
    required String link,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String pubDate,
    String? description,
  }) = _News;
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
