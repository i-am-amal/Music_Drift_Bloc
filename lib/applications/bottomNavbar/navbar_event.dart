part of 'navbar_bloc.dart';

@freezed
class NavbarEvent with _$NavbarEvent {
  const factory NavbarEvent.updateNavbar({
required int index

  }) = _UpdateNavbar;
}