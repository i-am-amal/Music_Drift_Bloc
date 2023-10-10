import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playscreen_event.dart';
part 'playscreen_state.dart';
part 'playscreen_bloc.freezed.dart';

class PlayscreenBloc extends Bloc<PlayscreenEvent, PlayscreenState> {
  PlayscreenBloc()
      : super(
          const _Initial(
            currentIndex: 0,
            duration: Duration(),
            position: Duration(),
          ),
        ) {
    on<_CurrentIndex>((event, emit) {
      int index = event.index;
      emit(state.copyWith(currentIndex: index));
    });

    on<_SetTime>((event, emit) {
      Duration time = event.time;
      emit(state.copyWith(duration: time));
    });

    on<_SetPosition>((event, emit) {
      Duration position = event.position;
      emit(state.copyWith(position: position));
    });

    on<_Update>((event, emit) {
      emit(state.copyWith(updateVariable: true));
      emit(state.copyWith(updateVariable: null));
    });
  }
}
