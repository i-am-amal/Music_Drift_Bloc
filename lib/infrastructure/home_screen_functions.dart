


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../applications/home/home_bloc.dart';

void requestStoragePermission(context,_audioQuery) async {
    await Permission.storage.request();

    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
        BlocProvider.of<HomeBloc>(context)
            .add(const HomeEvent.permissionStatus());
        // setState(() {});
      }
    }
  }