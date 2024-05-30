// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsResponseImpl _$$NewsResponseImplFromJson(Map<String, dynamic> json) =>
    _$NewsResponseImpl(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => News.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NewsResponseImplToJson(_$NewsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      articleId: json['article_id'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
      imageUrl: json['image_url'] as String?,
      pubDate: json['pubDate'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'link': instance.link,
      'image_url': instance.imageUrl,
      'pubDate': instance.pubDate,
      'description': instance.description,
    };
