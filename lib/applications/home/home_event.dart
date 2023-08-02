part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.updateSearchText({
    required String value
  }) = _UpdateSearchText;


  const factory HomeEvent.permissionStatus() = _PermissionStatus;
}