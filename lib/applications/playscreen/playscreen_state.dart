part of 'playscreen_bloc.dart';

@freezed
class PlayscreenState with _$PlayscreenState {
  const factory PlayscreenState.initial({
   required int currentIndex,
   required Duration duration,
   required Duration position,
   bool? updateVariable,
  }) = _Initial;
}
