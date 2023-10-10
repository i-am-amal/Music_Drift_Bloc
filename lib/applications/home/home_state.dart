part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    required String searchText,
    bool? permission,
  }) = _Initial;
}
