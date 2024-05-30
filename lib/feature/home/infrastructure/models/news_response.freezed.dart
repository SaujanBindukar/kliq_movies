// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return _NewsResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsResponse {
  String get status => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<News> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResponseCopyWith<NewsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResponseCopyWith<$Res> {
  factory $NewsResponseCopyWith(
          NewsResponse value, $Res Function(NewsResponse) then) =
      _$NewsResponseCopyWithImpl<$Res, NewsResponse>;
  @useResult
  $Res call({String status, int totalResults, List<News> results});
}

/// @nodoc
class _$NewsResponseCopyWithImpl<$Res, $Val extends NewsResponse>
    implements $NewsResponseCopyWith<$Res> {
  _$NewsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsResponseImplCopyWith<$Res>
    implements $NewsResponseCopyWith<$Res> {
  factory _$$NewsResponseImplCopyWith(
          _$NewsResponseImpl value, $Res Function(_$NewsResponseImpl) then) =
      __$$NewsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int totalResults, List<News> results});
}

/// @nodoc
class __$$NewsResponseImplCopyWithImpl<$Res>
    extends _$NewsResponseCopyWithImpl<$Res, _$NewsResponseImpl>
    implements _$$NewsResponseImplCopyWith<$Res> {
  __$$NewsResponseImplCopyWithImpl(
      _$NewsResponseImpl _value, $Res Function(_$NewsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_$NewsResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsResponseImpl implements _NewsResponse {
  const _$NewsResponseImpl(
      {required this.status,
      required this.totalResults,
      final List<News> results = const []})
      : _results = results;

  factory _$NewsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsResponseImplFromJson(json);

  @override
  final String status;
  @override
  final int totalResults;
  final List<News> _results;
  @override
  @JsonKey()
  List<News> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsResponseImplCopyWith<_$NewsResponseImpl> get copyWith =>
      __$$NewsResponseImplCopyWithImpl<_$NewsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsResponse implements NewsResponse {
  const factory _NewsResponse(
      {required final String status,
      required final int totalResults,
      final List<News> results}) = _$NewsResponseImpl;

  factory _NewsResponse.fromJson(Map<String, dynamic> json) =
      _$NewsResponseImpl.fromJson;

  @override
  String get status;
  @override
  int get totalResults;
  @override
  List<News> get results;
  @override
  @JsonKey(ignore: true)
  _$$NewsResponseImplCopyWith<_$NewsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  @JsonKey(name: 'article_id')
  String get articleId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String get pubDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') String articleId,
      String title,
      String link,
      @JsonKey(name: 'image_url') String? imageUrl,
      String pubDate,
      String? description});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? title = null,
    Object? link = null,
    Object? imageUrl = freezed,
    Object? pubDate = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: null == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') String articleId,
      String title,
      String link,
      @JsonKey(name: 'image_url') String? imageUrl,
      String pubDate,
      String? description});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? title = null,
    Object? link = null,
    Object? imageUrl = freezed,
    Object? pubDate = null,
    Object? description = freezed,
  }) {
    return _then(_$NewsImpl(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: null == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  const _$NewsImpl(
      {@JsonKey(name: 'article_id') required this.articleId,
      required this.title,
      required this.link,
      @JsonKey(name: 'image_url') this.imageUrl,
      required this.pubDate,
      this.description});

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  @JsonKey(name: 'article_id')
  final String articleId;
  @override
  final String title;
  @override
  final String link;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String pubDate;
  @override
  final String? description;

  @override
  String toString() {
    return 'News(articleId: $articleId, title: $title, link: $link, imageUrl: $imageUrl, pubDate: $pubDate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.pubDate, pubDate) || other.pubDate == pubDate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, articleId, title, link, imageUrl, pubDate, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  const factory _News(
      {@JsonKey(name: 'article_id') required final String articleId,
      required final String title,
      required final String link,
      @JsonKey(name: 'image_url') final String? imageUrl,
      required final String pubDate,
      final String? description}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  @JsonKey(name: 'article_id')
  String get articleId;
  @override
  String get title;
  @override
  String get link;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String get pubDate;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
