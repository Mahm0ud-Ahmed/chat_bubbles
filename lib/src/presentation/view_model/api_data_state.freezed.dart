// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiDataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiDataStateCopyWith<T, $Res> {
  factory $ApiDataStateCopyWith(
          ApiDataState<T> value, $Res Function(ApiDataState<T>) then) =
      _$ApiDataStateCopyWithImpl<T, $Res, ApiDataState<T>>;
}

/// @nodoc
class _$ApiDataStateCopyWithImpl<T, $Res, $Val extends ApiDataState<T>>
    implements $ApiDataStateCopyWith<T, $Res> {
  _$ApiDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiDataIdleImplCopyWith<T, $Res> {
  factory _$$ApiDataIdleImplCopyWith(_$ApiDataIdleImpl<T> value,
          $Res Function(_$ApiDataIdleImpl<T>) then) =
      __$$ApiDataIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ApiDataIdleImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataIdleImpl<T>>
    implements _$$ApiDataIdleImplCopyWith<T, $Res> {
  __$$ApiDataIdleImplCopyWithImpl(
      _$ApiDataIdleImpl<T> _value, $Res Function(_$ApiDataIdleImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ApiDataIdleImpl<T> implements ApiDataIdle<T> {
  const _$ApiDataIdleImpl();

  @override
  String toString() {
    return 'ApiDataState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiDataIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ApiDataIdle<T> implements ApiDataState<T> {
  const factory ApiDataIdle() = _$ApiDataIdleImpl<T>;
}

/// @nodoc
abstract class _$$ApiDataLoadingImplCopyWith<T, $Res> {
  factory _$$ApiDataLoadingImplCopyWith(_$ApiDataLoadingImpl<T> value,
          $Res Function(_$ApiDataLoadingImpl<T>) then) =
      __$$ApiDataLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ApiDataLoadingImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataLoadingImpl<T>>
    implements _$$ApiDataLoadingImplCopyWith<T, $Res> {
  __$$ApiDataLoadingImplCopyWithImpl(_$ApiDataLoadingImpl<T> _value,
      $Res Function(_$ApiDataLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ApiDataLoadingImpl<T> implements ApiDataLoading<T> {
  const _$ApiDataLoadingImpl();

  @override
  String toString() {
    return 'ApiDataState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiDataLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ApiDataLoading<T> implements ApiDataState<T> {
  const factory ApiDataLoading() = _$ApiDataLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ApiDataSuccessModelImplCopyWith<T, $Res> {
  factory _$$ApiDataSuccessModelImplCopyWith(_$ApiDataSuccessModelImpl<T> value,
          $Res Function(_$ApiDataSuccessModelImpl<T>) then) =
      __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? response});
}

/// @nodoc
class __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessModelImpl<T>>
    implements _$$ApiDataSuccessModelImplCopyWith<T, $Res> {
  __$$ApiDataSuccessModelImplCopyWithImpl(_$ApiDataSuccessModelImpl<T> _value,
      $Res Function(_$ApiDataSuccessModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$ApiDataSuccessModelImpl<T>(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ApiDataSuccessModelImpl<T> implements ApiDataSuccessModel<T> {
  const _$ApiDataSuccessModelImpl({required this.response});

  @override
  final T? response;

  @override
  String toString() {
    return 'ApiDataState<$T>.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessModelImpl<T> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
      get copyWith => __$$ApiDataSuccessModelImplCopyWithImpl<T,
          _$ApiDataSuccessModelImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessModel<T> implements ApiDataState<T> {
  const factory ApiDataSuccessModel({required final T? response}) =
      _$ApiDataSuccessModelImpl<T>;

  T? get response;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataSuccessListImplCopyWith<T, $Res> {
  factory _$$ApiDataSuccessListImplCopyWith(_$ApiDataSuccessListImpl<T> value,
          $Res Function(_$ApiDataSuccessListImpl<T>) then) =
      __$$ApiDataSuccessListImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T>? response});
}

/// @nodoc
class __$$ApiDataSuccessListImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessListImpl<T>>
    implements _$$ApiDataSuccessListImplCopyWith<T, $Res> {
  __$$ApiDataSuccessListImplCopyWithImpl(_$ApiDataSuccessListImpl<T> _value,
      $Res Function(_$ApiDataSuccessListImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$ApiDataSuccessListImpl<T>(
      response: freezed == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$ApiDataSuccessListImpl<T> implements ApiDataSuccessList<T> {
  const _$ApiDataSuccessListImpl({final List<T>? response})
      : _response = response;

  final List<T>? _response;
  @override
  List<T>? get response {
    final value = _response;
    if (value == null) return null;
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ApiDataState<$T>.successList(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessListImpl<T> &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessListImplCopyWith<T, _$ApiDataSuccessListImpl<T>>
      get copyWith => __$$ApiDataSuccessListImplCopyWithImpl<T,
          _$ApiDataSuccessListImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) {
    return successList(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) {
    return successList?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return successList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return successList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessList<T> implements ApiDataState<T> {
  const factory ApiDataSuccessList({final List<T>? response}) =
      _$ApiDataSuccessListImpl<T>;

  List<T>? get response;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessListImplCopyWith<T, _$ApiDataSuccessListImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataErrorImplCopyWith<T, $Res> {
  factory _$$ApiDataErrorImplCopyWith(_$ApiDataErrorImpl<T> value,
          $Res Function(_$ApiDataErrorImpl<T>) then) =
      __$$ApiDataErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppError? error});

  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ApiDataErrorImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataErrorImpl<T>>
    implements _$$ApiDataErrorImplCopyWith<T, $Res> {
  __$$ApiDataErrorImplCopyWithImpl(
      _$ApiDataErrorImpl<T> _value, $Res Function(_$ApiDataErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ApiDataErrorImpl<T>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ));
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ApiDataErrorImpl<T> implements ApiDataError<T> {
  const _$ApiDataErrorImpl({required this.error});

  @override
  final AppError? error;

  @override
  String toString() {
    return 'ApiDataState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      __$$ApiDataErrorImplCopyWithImpl<T, _$ApiDataErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? response) success,
    required TResult Function(List<T>? response) successList,
    required TResult Function(AppError? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? response)? success,
    TResult? Function(List<T>? response)? successList,
    TResult? Function(AppError? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T? response)? success,
    TResult Function(List<T>? response)? successList,
    TResult Function(AppError? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiDataError<T> implements ApiDataState<T> {
  const factory ApiDataError({required final AppError? error}) =
      _$ApiDataErrorImpl<T>;

  AppError? get error;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
