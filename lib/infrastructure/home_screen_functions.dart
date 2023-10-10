import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../applications/home/home_bloc.dart';

void requestStoragePermission(context, audioQuery) async {
  await Permission.storage.request();

  if (!kIsWeb) {
    bool permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await audioQuery.permissionsRequest();
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.permissionStatus());
    }
  }
}
