import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_drift/infrastructure/db_services/db_fav.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/infrastructure/db_services/db_recents.dart';
import 'package:music_drift/presentation/screens/splash_screen/splash_screen.dart';

import '../../domain/model/audio_player.dart';
import '../../domain/model/most_play.dart';

class PlaylistDb extends ChangeNotifier {
  static ValueNotifier<List<AudioPlayer>> playlistNotifier = ValueNotifier([]);

  ///////////////////-------------Playlist ListTile Add---------------------//////////////////////

  static Future<void> playlistAdd(AudioPlayer value) async {
    final playlistdb = Hive.box<AudioPlayer>('playlistDB');
    await playlistdb.add(value);
    playlistNotifier.value.add(value);
    getAllPlaylist();
  }

  ///////////////////-------------Playlist ListTile Update---------------------//////////////////////

  static Future<void> playlistUpdate(AudioPlayer value, index) async {
    final playlistdb = Hive.box<AudioPlayer>('playlistDB');
    await playlistdb.putAt(index, value);
    playlistNotifier.value.add(value);
    getAllPlaylist();
  }

  ///////////////////-------------Playlist ListTile GetAll---------------------//////////////////////

  static getAllPlaylist() async {
    final playlistdb = Hive.box<AudioPlayer>('playlistDB');
    playlistNotifier.value.clear();
    playlistNotifier.value.addAll(playlistdb.values);
    playlistNotifier.notifyListeners();
  }

  ///////////////////-------------Playlist ListTile Delete---------------------//////////////////////

  static playlistDelete(int index) async {
    final playlistdb = Hive.box<AudioPlayer>('playlistDB');
    await playlistdb.deleteAt(index);
    getAllPlaylist();
  }

  ///////////////////-------------Playlist ListTile Check---------------------//////////////////////

  bool playlistnameCheck(name) {
    bool result = false;

    for (int i = 0; i < playlistNotifier.value.length; i++) {
      if (playlistNotifier.value[i].name == name) {
        result = true;
      }
      if (result == true) {
        break;
      }
    }
    return result;
  }

  ///////////////////-------------App Reset---------------------//////////////////////

  Future<void> appReset(context) async {
    final playlistDb = Hive.box<AudioPlayer>('playlistDB');
    final musicDb = Hive.box<int>('favouriteDB');
    final recentDb = Hive.box<int>('recentsDB');
    final mostPlayedDb = Hive.box<MostPlay>('mostPlayedDB');

    await musicDb.clear();
    await playlistDb.clear();
    await recentDb.clear();
    await mostPlayedDb.clear();
    RecentsDb.recentSongs.value.clear();
    FavouriteDb.favouriteSongs.value.clear();
    MostPlayedDb.mostPlayedSongs.value.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        (Route<dynamic> route) => false);
  }
}
