import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';
part 'navbar_bloc.freezed.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const _Initial(selectedIndex: 0)) {
    on<_UpdateNavbar>((event, emit) {
      int index = event.index;
      emit(state.copyWith(selectedIndex: index));
    });
  }
}
