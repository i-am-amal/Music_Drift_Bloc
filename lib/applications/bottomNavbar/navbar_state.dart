part of 'navbar_bloc.dart';

@freezed
class NavbarState with _$NavbarState {
  const factory NavbarState.initial({required int selectedIndex}) = _Initial;
}
