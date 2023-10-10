import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'miniplayer_event.dart';
part 'miniplayer_state.dart';
part 'miniplayer_bloc.freezed.dart';

class MiniplayerBloc extends Bloc<MiniplayerEvent, MiniplayerState> {
  MiniplayerBloc() : super(const _Initial()) {
    on<MiniplayerEvent>((event, emit) {
    });
  }
}
