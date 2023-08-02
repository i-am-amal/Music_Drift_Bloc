part of 'playscreen_bloc.dart';

@freezed
class PlayscreenEvent with _$PlayscreenEvent {
  const factory PlayscreenEvent.currentIndex({ 
   required int index,
  }) = _CurrentIndex;


 const factory PlayscreenEvent.setTime({ 
   required Duration time,
  }) = _SetTime;

const factory PlayscreenEvent.setPosition({ 
   required Duration position,
  }) = _SetPosition;

  const factory PlayscreenEvent.update() = _Update;


}