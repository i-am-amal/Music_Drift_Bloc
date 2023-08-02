import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

ValueNotifier<List<SongModel>> musiclistNotifier = ValueNotifier([]);

class FavouriteDb extends ChangeNotifier {
  static bool isfavourite = false;
  static final musicDb = Hive.box<int>('favouriteDB');

  static ValueNotifier<List<SongModel>> favouriteSongs = ValueNotifier([]);

///////////////////-------------Favourite Check---------------------//////////////////////

  static isFavourite(List<SongModel> songs) {
    for (SongModel song in songs) {
      if (favourCheck(song)) {
        favouriteSongs.value.add(song);
      }
    }
    isfavourite = true;
  }

  static bool favourCheck(SongModel song) {
    if (musicDb.values.contains(song.id)) {
      return true;
    }
    return false;
  }

///////////////////-------------Favourite Add---------------------//////////////////////

  static add(SongModel song) async {
    musicDb.add(song.id);
    favouriteSongs.value.add(song);
    FavouriteDb.favouriteSongs.notifyListeners();
  }

///////////////////-------------Favourite Delete---------------------//////////////////////

  static delete(int id) async {
    int deletekey = 0;
    if (!musicDb.values.contains(id)) {
      return;
    }

    final Map<dynamic, int> favourMap = musicDb.toMap();
    favourMap.forEach((key, value) {
      if (value == id) {
        deletekey = key;
      }
    });

    musicDb.delete(deletekey);
    favouriteSongs.value.removeWhere((song) => song.id == id);
  }
}
