import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentsDb extends ChangeNotifier {
  static bool isRecent = false;
  static final recentDb = Hive.box<int>('recentsDB');
  static ValueNotifier<List<SongModel>> recentSongs = ValueNotifier([]);

  ///////////////////-------------RecentSong Check---------------------//////////////////////

  static isRecentSong(List<SongModel> songs) {
    for (SongModel song in songs) {
      if (recentCheck(song)) {
        recentSongs.value.add(song);
      }
    }
    sortRecentSongs();
    isRecent = true;
  }

  ///////////////////-------------RecentSong Sort---------------------//////////////////////

  static sortRecentSongs() {
    Iterable<SongModel> inReverse = recentSongs.value.reversed;
    recentSongs.value = inReverse.toList();
  }

  ///////////////////-------------RecentSong Check---------------------//////////////////////

  static bool recentCheck(SongModel song) {
    for (var vals in recentDb.values) {
      if (vals == song.id) {
        return true;
      }
    }
    return false;
  }

  ///////////////////-------------RecentSong Add---------------------//////////////////////

  static addRecents(SongModel song) async {
    if (!recentCheck(song)) {
      recentDb.add(song.id);
      recentSongs.value.add(song);
    } else {
      for (var vals in recentDb.values) {
        if (vals == song.id) {
          delete(song.id);
          recentDb.add(song.id);
          recentSongs.value.add(song);
        }
      }
    }
    RecentsDb.recentSongs.notifyListeners();
  }

  ///////////////////-------------RecentSong Delete---------------------//////////////////////

  static delete(int id) async {
    int deletekey = 0;
    if (!recentDb.values.contains(id)) {
      return;
    }

    final Map<dynamic, int> recentMap = recentDb.toMap();
    recentMap.forEach((key, value) {
      if (value == id) {
        deletekey = key;
      }
    });

    recentDb.delete(deletekey);
    recentSongs.value.removeWhere((song) => song.id == id);
  }
}
