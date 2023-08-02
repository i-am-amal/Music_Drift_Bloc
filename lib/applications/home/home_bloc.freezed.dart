// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateSearchText,
    required TResult Function() permissionStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateSearchText,
    TResult? Function()? permissionStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateSearchText,
    TResult Function()? permissionStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSearchText value) updateSearchText,
    required TResult Function(_PermissionStatus value) permissionStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSearchText value)? updateSearchText,
    TResult? Function(_PermissionStatus value)? permissionStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSearchText value)? updateSearchText,
    TResult Function(_PermissionStatus value)? permissionStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateSearchTextCopyWith<$Res> {
  factory _$$_UpdateSearchTextCopyWith(
          _$_UpdateSearchText value, $Res Function(_$_UpdateSearchText) then) =
      __$$_UpdateSearchTextCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_UpdateSearchTextCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_UpdateSearchText>
    implements _$$_UpdateSearchTextCopyWith<$Res> {
  __$$_UpdateSearchTextCopyWithImpl(
      _$_UpdateSearchText _value, $Res Function(_$_UpdateSearchText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_UpdateSearchText(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSearchText implements _UpdateSearchText {
  const _$_UpdateSearchText({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'HomeEvent.updateSearchText(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSearchText &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSearchTextCopyWith<_$_UpdateSearchText> get copyWith =>
      __$$_UpdateSearchTextCopyWithImpl<_$_UpdateSearchText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateSearchText,
    required TResult Function() permissionStatus,
  }) {
    return updateSearchText(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateSearchText,
    TResult? Function()? permissionStatus,
  }) {
    return updateSearchText?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateSearchText,
    TResult Function()? permissionStatus,
    required TResult orElse(),
  }) {
    if (updateSearchText != null) {
      return updateSearchText(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSearchText value) updateSearchText,
    required TResult Function(_PermissionStatus value) permissionStatus,
  }) {
    return updateSearchText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSearchText value)? updateSearchText,
    TResult? Function(_PermissionStatus value)? permissionStatus,
  }) {
    return updateSearchText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSearchText value)? updateSearchText,
    TResult Function(_PermissionStatus value)? permissionStatus,
    required TResult orElse(),
  }) {
    if (updateSearchText != null) {
      return updateSearchText(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchText implements HomeEvent {
  const factory _UpdateSearchText({required final String value}) =
      _$_UpdateSearchText;

  String get value;
  @JsonKey(ignore: true)
  _$$_UpdateSearchTextCopyWith<_$_UpdateSearchText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PermissionStatusCopyWith<$Res> {
  factory _$$_PermissionStatusCopyWith(
          _$_PermissionStatus value, $Res Function(_$_PermissionStatus) then) =
      __$$_PermissionStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PermissionStatusCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_PermissionStatus>
    implements _$$_PermissionStatusCopyWith<$Res> {
  __$$_PermissionStatusCopyWithImpl(
      _$_PermissionStatus _value, $Res Function(_$_PermissionStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PermissionStatus implements _PermissionStatus {
  const _$_PermissionStatus();

  @override
  String toString() {
    return 'HomeEvent.permissionStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PermissionStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateSearchText,
    required TResult Function() permissionStatus,
  }) {
    return permissionStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateSearchText,
    TResult? Function()? permissionStatus,
  }) {
    return permissionStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateSearchText,
    TResult Function()? permissionStatus,
    required TResult orElse(),
  }) {
    if (permissionStatus != null) {
      return permissionStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateSearchText value) updateSearchText,
    required TResult Function(_PermissionStatus value) permissionStatus,
  }) {
    return permissionStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateSearchText value)? updateSearchText,
    TResult? Function(_PermissionStatus value)? permissionStatus,
  }) {
    return permissionStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateSearchText value)? updateSearchText,
    TResult Function(_PermissionStatus value)? permissionStatus,
    required TResult orElse(),
  }) {
    if (permissionStatus != null) {
      return permissionStatus(this);
    }
    return orElse();
  }
}

abstract class _PermissionStatus implements HomeEvent {
  const factory _PermissionStatus() = _$_PermissionStatus;
}

/// @nodoc
mixin _$HomeState {
  String get searchText => throw _privateConstructorUsedError;
  bool? get permission => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, bool? permission) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, bool? permission)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, bool? permission)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({String searchText, bool? permission});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? permission = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchText, bool? permission});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? permission = freezed,
  }) {
    return _then(_$_Initial(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.searchText, this.permission});

  @override
  final String searchText;
  @override
  final bool? permission;

  @override
  String toString() {
    return 'HomeState.initial(searchText: $searchText, permission: $permission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, bool? permission) initial,
  }) {
    return initial(searchText, permission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchText, bool? permission)? initial,
  }) {
    return initial?.call(searchText, permission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, bool? permission)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(searchText, permission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String searchText, final bool? permission}) = _$_Initial;

  @override
  String get searchText;
  @override
  bool? get permission;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
