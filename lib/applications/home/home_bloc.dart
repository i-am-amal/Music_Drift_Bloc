import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _Initial(searchText: '')) {
    on<_UpdateSearchText>((event, emit) {
      String value = event.value;
      emit(state.copyWith(searchText: value));
    });
    on<_PermissionStatus>((event, emit) {
      emit(state.copyWith(permission: true));
    });
  }
}
