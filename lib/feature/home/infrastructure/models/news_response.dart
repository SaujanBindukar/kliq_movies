import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_box.dart';

part 'news_response.freezed.dart';

part 'news_response.g.dart';

@HiveType(typeId: HiveBox.favouriteNewsResponseBoxId)
@freezed
class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    @HiveField(0) required String status,
    @HiveField(1) required int totalResults,
    @HiveField(2) @Default([]) List<News> results,
  }) = _NewsResponse;
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@HiveType(typeId: HiveBox.favouriteNewsBoxId)
@freezed
class News with _$News {
  const factory News({
    @HiveField(0) @JsonKey(name: 'article_id') required String articleId,
    @HiveField(1) required String title,
    @HiveField(2) required String link,
    @HiveField(3) @JsonKey(name: 'image_url') String? imageUrl,
    @HiveField(4) required String pubDate,
    @HiveField(5) String? description,
    @HiveField(6) @Default(false) bool isFavourite,
  }) = _News;
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
