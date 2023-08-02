import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'miniplayer_event.dart';
part 'miniplayer_state.dart';
part 'miniplayer_bloc.freezed.dart';

class MiniplayerBloc extends Bloc<MiniplayerEvent, MiniplayerState> {
  MiniplayerBloc() : super(_Initial()) {
    on<MiniplayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
