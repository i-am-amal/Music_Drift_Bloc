// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playscreen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayscreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
    required TResult Function(Duration time) setTime,
    required TResult Function(Duration position) setPosition,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
    TResult? Function(Duration time)? setTime,
    TResult? Function(Duration position)? setPosition,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    TResult Function(Duration time)? setTime,
    TResult Function(Duration position)? setPosition,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
    required TResult Function(_SetTime value) setTime,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
    TResult? Function(_SetTime value)? setTime,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    TResult Function(_SetTime value)? setTime,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayscreenEventCopyWith<$Res> {
  factory $PlayscreenEventCopyWith(
          PlayscreenEvent value, $Res Function(PlayscreenEvent) then) =
      _$PlayscreenEventCopyWithImpl<$Res, PlayscreenEvent>;
}

/// @nodoc
class _$PlayscreenEventCopyWithImpl<$Res, $Val extends PlayscreenEvent>
    implements $PlayscreenEventCopyWith<$Res> {
  _$PlayscreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CurrentIndexCopyWith<$Res> {
  factory _$$_CurrentIndexCopyWith(
          _$_CurrentIndex value, $Res Function(_$_CurrentIndex) then) =
      __$$_CurrentIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_CurrentIndexCopyWithImpl<$Res>
    extends _$PlayscreenEventCopyWithImpl<$Res, _$_CurrentIndex>
    implements _$$_CurrentIndexCopyWith<$Res> {
  __$$_CurrentIndexCopyWithImpl(
      _$_CurrentIndex _value, $Res Function(_$_CurrentIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_CurrentIndex(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CurrentIndex implements _CurrentIndex {
  const _$_CurrentIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'PlayscreenEvent.currentIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentIndexCopyWith<_$_CurrentIndex> get copyWith =>
      __$$_CurrentIndexCopyWithImpl<_$_CurrentIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
    required TResult Function(Duration time) setTime,
    required TResult Function(Duration position) setPosition,
    required TResult Function() refresh,
  }) {
    return currentIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
    TResult? Function(Duration time)? setTime,
    TResult? Function(Duration position)? setPosition,
    TResult? Function()? refresh,
  }) {
    return currentIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    TResult Function(Duration time)? setTime,
    TResult Function(Duration position)? setPosition,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (currentIndex != null) {
      return currentIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
    required TResult Function(_SetTime value) setTime,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Refresh value) refresh,
  }) {
    return currentIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
    TResult? Function(_SetTime value)? setTime,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return currentIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    TResult Function(_SetTime value)? setTime,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (currentIndex != null) {
      return currentIndex(this);
    }
    return orElse();
  }
}

abstract class _CurrentIndex implements PlayscreenEvent {
  const factory _CurrentIndex({required final int index}) = _$_CurrentIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$_CurrentIndexCopyWith<_$_CurrentIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetTimeCopyWith<$Res> {
  factory _$$_SetTimeCopyWith(
          _$_SetTime value, $Res Function(_$_SetTime) then) =
      __$$_SetTimeCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration time});
}

/// @nodoc
class __$$_SetTimeCopyWithImpl<$Res>
    extends _$PlayscreenEventCopyWithImpl<$Res, _$_SetTime>
    implements _$$_SetTimeCopyWith<$Res> {
  __$$_SetTimeCopyWithImpl(_$_SetTime _value, $Res Function(_$_SetTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$_SetTime(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_SetTime implements _SetTime {
  const _$_SetTime({required this.time});

  @override
  final Duration time;

  @override
  String toString() {
    return 'PlayscreenEvent.setTime(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTime &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetTimeCopyWith<_$_SetTime> get copyWith =>
      __$$_SetTimeCopyWithImpl<_$_SetTime>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
    required TResult Function(Duration time) setTime,
    required TResult Function(Duration position) setPosition,
    required TResult Function() refresh,
  }) {
    return setTime(time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
    TResult? Function(Duration time)? setTime,
    TResult? Function(Duration position)? setPosition,
    TResult? Function()? refresh,
  }) {
    return setTime?.call(time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    TResult Function(Duration time)? setTime,
    TResult Function(Duration position)? setPosition,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (setTime != null) {
      return setTime(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
    required TResult Function(_SetTime value) setTime,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Refresh value) refresh,
  }) {
    return setTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
    TResult? Function(_SetTime value)? setTime,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return setTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    TResult Function(_SetTime value)? setTime,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (setTime != null) {
      return setTime(this);
    }
    return orElse();
  }
}

abstract class _SetTime implements PlayscreenEvent {
  const factory _SetTime({required final Duration time}) = _$_SetTime;

  Duration get time;
  @JsonKey(ignore: true)
  _$$_SetTimeCopyWith<_$_SetTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetPositionCopyWith<$Res> {
  factory _$$_SetPositionCopyWith(
          _$_SetPosition value, $Res Function(_$_SetPosition) then) =
      __$$_SetPositionCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$_SetPositionCopyWithImpl<$Res>
    extends _$PlayscreenEventCopyWithImpl<$Res, _$_SetPosition>
    implements _$$_SetPositionCopyWith<$Res> {
  __$$_SetPositionCopyWithImpl(
      _$_SetPosition _value, $Res Function(_$_SetPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$_SetPosition(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_SetPosition implements _SetPosition {
  const _$_SetPosition({required this.position});

  @override
  final Duration position;

  @override
  String toString() {
    return 'PlayscreenEvent.setPosition(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetPosition &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetPositionCopyWith<_$_SetPosition> get copyWith =>
      __$$_SetPositionCopyWithImpl<_$_SetPosition>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
    required TResult Function(Duration time) setTime,
    required TResult Function(Duration position) setPosition,
    required TResult Function() refresh,
  }) {
    return setPosition(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
    TResult? Function(Duration time)? setTime,
    TResult? Function(Duration position)? setPosition,
    TResult? Function()? refresh,
  }) {
    return setPosition?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    TResult Function(Duration time)? setTime,
    TResult Function(Duration position)? setPosition,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
    required TResult Function(_SetTime value) setTime,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Refresh value) refresh,
  }) {
    return setPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
    TResult? Function(_SetTime value)? setTime,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return setPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    TResult Function(_SetTime value)? setTime,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(this);
    }
    return orElse();
  }
}

abstract class _SetPosition implements PlayscreenEvent {
  const factory _SetPosition({required final Duration position}) =
      _$_SetPosition;

  Duration get position;
  @JsonKey(ignore: true)
  _$$_SetPositionCopyWith<_$_SetPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> {
  factory _$$_RefreshCopyWith(
          _$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res>
    extends _$PlayscreenEventCopyWithImpl<$Res, _$_Refresh>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh();

  @override
  String toString() {
    return 'PlayscreenEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
    required TResult Function(Duration time) setTime,
    required TResult Function(Duration position) setPosition,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
    TResult? Function(Duration time)? setTime,
    TResult? Function(Duration position)? setPosition,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    TResult Function(Duration time)? setTime,
    TResult Function(Duration position)? setPosition,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
    required TResult Function(_SetTime value) setTime,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
    TResult? Function(_SetTime value)? setTime,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    TResult Function(_SetTime value)? setTime,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PlayscreenEvent {
  const factory _Refresh() = _$_Refresh;
}

/// @nodoc
mixin _$PlayscreenState {
  int get currentIndex => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  bool? get refreshVariable => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, Duration duration,
            Duration position, bool? refreshVariable)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, Duration duration, Duration position,
            bool? refreshVariable)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, Duration duration, Duration position,
            bool? refreshVariable)?
        initial,
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
  $PlayscreenStateCopyWith<PlayscreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayscreenStateCopyWith<$Res> {
  factory $PlayscreenStateCopyWith(
          PlayscreenState value, $Res Function(PlayscreenState) then) =
      _$PlayscreenStateCopyWithImpl<$Res, PlayscreenState>;
  @useResult
  $Res call(
      {int currentIndex,
      Duration duration,
      Duration position,
      bool? refreshVariable});
}

/// @nodoc
class _$PlayscreenStateCopyWithImpl<$Res, $Val extends PlayscreenState>
    implements $PlayscreenStateCopyWith<$Res> {
  _$PlayscreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? duration = null,
    Object? position = null,
    Object? refreshVariable = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      refreshVariable: freezed == refreshVariable
          ? _value.refreshVariable
          : refreshVariable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $PlayscreenStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentIndex,
      Duration duration,
      Duration position,
      bool? refreshVariable});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PlayscreenStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? duration = null,
    Object? position = null,
    Object? refreshVariable = freezed,
  }) {
    return _then(_$_Initial(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      refreshVariable: freezed == refreshVariable
          ? _value.refreshVariable
          : refreshVariable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.currentIndex,
      required this.duration,
      required this.position,
      this.refreshVariable});

  @override
  final int currentIndex;
  @override
  final Duration duration;
  @override
  final Duration position;
  @override
  final bool? refreshVariable;

  @override
  String toString() {
    return 'PlayscreenState.initial(currentIndex: $currentIndex, duration: $duration, position: $position, refreshVariable: $refreshVariable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.refreshVariable, refreshVariable) ||
                other.refreshVariable == refreshVariable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentIndex, duration, position, refreshVariable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, Duration duration,
            Duration position, bool? refreshVariable)
        initial,
  }) {
    return initial(currentIndex, duration, position, refreshVariable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, Duration duration, Duration position,
            bool? refreshVariable)?
        initial,
  }) {
    return initial?.call(currentIndex, duration, position, refreshVariable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, Duration duration, Duration position,
            bool? refreshVariable)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currentIndex, duration, position, refreshVariable);
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

abstract class _Initial implements PlayscreenState {
  const factory _Initial(
      {required final int currentIndex,
      required final Duration duration,
      required final Duration position,
      final bool? refreshVariable}) = _$_Initial;

  @override
  int get currentIndex;
  @override
  Duration get duration;
  @override
  Duration get position;
  @override
  bool? get refreshVariable;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
