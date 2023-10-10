import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_drift/applications/bottomNavbar/navbar_bloc.dart';
import 'package:music_drift/applications/home/home_bloc.dart';
import 'package:music_drift/applications/playscreen/playscreen_bloc.dart';
import 'package:music_drift/presentation/screens/splash_screen/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'domain/model/audio_player.dart';
import 'domain/model/most_play.dart';

Future<void> main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(AudioPlayerAdapter().typeId)) {
    Hive.registerAdapter(AudioPlayerAdapter());
  }
  if (!Hive.isAdapterRegistered(MostPlayAdapter().typeId)) {
    Hive.registerAdapter(MostPlayAdapter());
  }

  await Hive.openBox<int>('favouriteDB');
  await Hive.openBox<MostPlay>('mostPlayedDB');
  await Hive.openBox<int>('recentsDB');
  await Hive.openBox<AudioPlayer>('playlistDB');

  await Permission.storage.request();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(
    const MusicApp(),
  );
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => PlayscreenBloc(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => NavbarBloc(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        title: 'Music Drift',
        home: const SplashScreen(),
      ),
    );
  }
}
