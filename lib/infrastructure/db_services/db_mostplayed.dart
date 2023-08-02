import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../domain/model/most_play.dart';

class MostPlayedDb extends ChangeNotifier {
  static bool isMostPlayed = false;
  static final mostPlayedDb = Hive.box<MostPlay>('mostPlayedDB');

  static ValueNotifier<List<SongModel>> mostPlayedSongs = ValueNotifier([]);

  static List<SongModel> tempMostPlayedSongs = [];

///////////////////-------------Mostplayed Check---------------------//////////////////////

  static isMostlyPlayedSong(List<SongModel> songs) {
    for (SongModel song in songs) {
      if (mostPlayedCheck(song)) {
        tempMostPlayedSongs.add(song);
      }
    }
    mostPlayedSongs.value = [...tempMostPlayedSongs];
    mostPlayedSongs.value.sort((a, b) => getCount(b).compareTo(getCount(a)));
    isMostPlayed = true;
  }

///////////////////-------------Mostplayed Sorting---------------------//////////////////////

  static getCount(SongModel song) {
    for (var vals in mostPlayedDb.values) {
      if (vals.songId == song.id) {
        return vals.count;
      }
    }
  }

  static sortMostPlayed() {
    mostPlayedSongs.value.sort((a, b) => getCount(b).compareTo(getCount(a)));
  }

///////////////////-------------Mostplayed Check---------------------//////////////////////

  static bool mostPlayedCheck(SongModel song) {
    for (var vals in mostPlayedDb.values) {
      if (vals.songId == song.id) {
        // print('most played detected');
        // print(vals.count);
        return true;
      }
    }
    //print('not in most played');
    return false;
  }

///////////////////-------------Mostplayed Add---------------------//////////////////////

  static addMostlyPlayed(SongModel song) async {
    int currentCount = 0;

    bool detected = false;
    for (var vals in mostPlayedDb.values) {
      if (vals.songId == song.id) {
        if (vals.count != null) {
          currentCount = vals.count!;
        }
        // print('most played added');
        // print(vals.count);
        // print('is the count');
        int newCount = currentCount + 1;
        MostPlay mostPlayObj =
            MostPlay(songId: song.id, count: newCount, index: vals.index);
        if (vals.index != null) {
          mostPlayedDb.putAt(vals.index!, mostPlayObj);
        }
        detected = true;
      }
    }

    if (detected == false) {
      int index;
      MostPlay mostPlayObj = MostPlay(songId: song.id, count: 1);
      index = await mostPlayedDb.add(mostPlayObj);
      mostPlayObj.index = index;
      mostPlayedDb.putAt(index, mostPlayObj);
      mostPlayedSongs.value.add(song);
      MostPlayedDb.mostPlayedSongs.notifyListeners();
      // print('notifying..');
    }
  }

///////////////////-------------Mostplayed Delete---------------------//////////////////////

  static delete(int id) async {
    int deletekey = 0;
    // ignore: iterable_contains_unrelated_type
    if (!mostPlayedDb.values.contains(id)) {
      return;
    }

    final Map<dynamic, MostPlay?> mostlyMap = mostPlayedDb.toMap();
    mostlyMap.forEach((key, value) {
      if (value?.songId == id) {
        deletekey = key;
      }
    });

    mostPlayedDb.delete(deletekey);
    mostPlayedSongs.value.removeWhere((song) => song.id == id);
  }
}
