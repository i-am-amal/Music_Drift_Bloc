// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:music_drift/infrastructure/db_services/db_fav.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({required this.song, super.key});

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FavouriteDb.favouriteSongs,
      builder:
          (BuildContext context, List<SongModel> favourData, Widget? child) {
        return IconButton(
          onPressed: (() {
            if (FavouriteDb.favourCheck(song)) {
              ///////////////////-------------Delete Fav Song---------------------//////////////////////

              FavouriteDb.delete(song.id);
              FavouriteDb.favouriteSongs.notifyListeners();

              const snackBar = SnackBar(
                backgroundColor: Color.fromRGBO(96, 27, 68, 1),
                duration: Duration(milliseconds: 800),
                behavior: SnackBarBehavior.floating,
                width: 200,
                content: Text(
                  'Removed From Favourites',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              ///////////////////-------------Add Fav Song---------------------//////////////////////

              FavouriteDb.add(song);
              FavouriteDb.favouriteSongs.notifyListeners();

              const snackBar = SnackBar(
                backgroundColor: Color.fromRGBO(96, 27, 68, 1),
                duration: Duration(milliseconds: 800),
                behavior: SnackBarBehavior.floating,
                width: 200,
                content: Text(
                  'Added to Favourites',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            FavouriteDb.favouriteSongs.notifyListeners();
          }),
          icon: FavouriteDb.favourCheck(song)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
        );
      },
    );
  }
}
