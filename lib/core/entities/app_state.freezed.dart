// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T? data) authenticated,
    required TResult Function(bool signIn, dynamic s) unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(T? data)? authenticated,
    TResult? Function(bool signIn, dynamic s)? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T? data)? authenticated,
    TResult Function(bool signIn, dynamic s)? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStarted<T> value)? started,
    TResult? Function(Authenticated<T> value)? authenticated,
    TResult? Function(UnAuthenticated<T> value)? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<T, $Res> {
  factory $AppStateCopyWith(
          AppState<T> value, $Res Function(AppState<T>) then) =
      _$AppStateCopyWithImpl<T, $Res, AppState<T>>;
}

/// @nodoc
class _$AppStateCopyWithImpl<T, $Res, $Val extends AppState<T>>
    implements $AppStateCopyWith<T, $Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppStartedImplCopyWith<T, $Res> {
  factory _$$AppStartedImplCopyWith(
          _$AppStartedImpl<T> value, $Res Function(_$AppStartedImpl<T>) then) =
      __$$AppStartedImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AppStartedImplCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AppStartedImpl<T>>
    implements _$$AppStartedImplCopyWith<T, $Res> {
  __$$AppStartedImplCopyWithImpl(
      _$AppStartedImpl<T> _value, $Res Function(_$AppStartedImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppStartedImpl<T> implements AppStarted<T> {
  const _$AppStartedImpl();

  @override
  String toString() {
    return 'AppState<$T>.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppStartedImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T? data) authenticated,
    required TResult Function(bool signIn, dynamic s) unAuthenticated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(T? data)? authenticated,
    TResult? Function(bool signIn, dynamic s)? unAuthenticated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T? data)? authenticated,
    TResult Function(bool signIn, dynamic s)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStarted<T> value)? started,
    TResult? Function(Authenticated<T> value)? authenticated,
    TResult? Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AppStarted<T> implements AppState<T> {
  const factory AppStarted() = _$AppStartedImpl<T>;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<T, $Res> {
  factory _$$AuthenticatedImplCopyWith(_$AuthenticatedImpl<T> value,
          $Res Function(_$AuthenticatedImpl<T>) then) =
      __$$AuthenticatedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AuthenticatedImpl<T>>
    implements _$$AuthenticatedImplCopyWith<T, $Res> {
  __$$AuthenticatedImplCopyWithImpl(_$AuthenticatedImpl<T> _value,
      $Res Function(_$AuthenticatedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AuthenticatedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl<T> implements Authenticated<T> {
  const _$AuthenticatedImpl(this.data);

  @override
  final T? data;

  @override
  String toString() {
    return 'AppState<$T>.authenticated(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<T, _$AuthenticatedImpl<T>> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<T, _$AuthenticatedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T? data) authenticated,
    required TResult Function(bool signIn, dynamic s) unAuthenticated,
  }) {
    return authenticated(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(T? data)? authenticated,
    TResult? Function(bool signIn, dynamic s)? unAuthenticated,
  }) {
    return authenticated?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T? data)? authenticated,
    TResult Function(bool signIn, dynamic s)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStarted<T> value)? started,
    TResult? Function(Authenticated<T> value)? authenticated,
    TResult? Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated<T> implements AppState<T> {
  const factory Authenticated(final T? data) = _$AuthenticatedImpl<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<T, _$AuthenticatedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnAuthenticatedImplCopyWith<T, $Res> {
  factory _$$UnAuthenticatedImplCopyWith(_$UnAuthenticatedImpl<T> value,
          $Res Function(_$UnAuthenticatedImpl<T>) then) =
      __$$UnAuthenticatedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool signIn, dynamic s});
}

/// @nodoc
class __$$UnAuthenticatedImplCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$UnAuthenticatedImpl<T>>
    implements _$$UnAuthenticatedImplCopyWith<T, $Res> {
  __$$UnAuthenticatedImplCopyWithImpl(_$UnAuthenticatedImpl<T> _value,
      $Res Function(_$UnAuthenticatedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signIn = null,
    Object? s = freezed,
  }) {
    return _then(_$UnAuthenticatedImpl<T>(
      signIn: null == signIn
          ? _value.signIn
          : signIn // ignore: cast_nullable_to_non_nullable
              as bool,
      s: freezed == s ? _value.s! : s,
    ));
  }
}

/// @nodoc

class _$UnAuthenticatedImpl<T> implements UnAuthenticated<T> {
  const _$UnAuthenticatedImpl({this.signIn = false, this.s});

  @override
  @JsonKey()
  final bool signIn;
  @override
  final dynamic s;

  @override
  String toString() {
    return 'AppState<$T>.unAuthenticated(signIn: $signIn, s: $s)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnAuthenticatedImpl<T> &&
            (identical(other.signIn, signIn) || other.signIn == signIn) &&
            const DeepCollectionEquality().equals(other.s, s));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, signIn, const DeepCollectionEquality().hash(s));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnAuthenticatedImplCopyWith<T, _$UnAuthenticatedImpl<T>> get copyWith =>
      __$$UnAuthenticatedImplCopyWithImpl<T, _$UnAuthenticatedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T? data) authenticated,
    required TResult Function(bool signIn, dynamic s) unAuthenticated,
  }) {
    return unAuthenticated(signIn, s);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(T? data)? authenticated,
    TResult? Function(bool signIn, dynamic s)? unAuthenticated,
  }) {
    return unAuthenticated?.call(signIn, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T? data)? authenticated,
    TResult Function(bool signIn, dynamic s)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(signIn, s);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(Authenticated<T> value) authenticated,
    required TResult Function(UnAuthenticated<T> value) unAuthenticated,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStarted<T> value)? started,
    TResult? Function(Authenticated<T> value)? authenticated,
    TResult? Function(UnAuthenticated<T> value)? unAuthenticated,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(Authenticated<T> value)? authenticated,
    TResult Function(UnAuthenticated<T> value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthenticated<T> implements AppState<T> {
  const factory UnAuthenticated({final bool signIn, final dynamic s}) =
      _$UnAuthenticatedImpl<T>;

  bool get signIn;
  dynamic get s;
  @JsonKey(ignore: true)
  _$$UnAuthenticatedImplCopyWith<T, _$UnAuthenticatedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
