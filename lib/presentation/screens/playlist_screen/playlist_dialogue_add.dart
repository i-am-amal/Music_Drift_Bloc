import 'package:flutter/material.dart';
import 'package:music_drift/infrastructure/db_services/db_playlist.dart';

import '../../../domain/model/audio_player.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController newPlaylistController = TextEditingController();

class DialogList {
  ///////////////////-------------Create Dialoge Box---------------------//////////////////////

  static addPlaylistDialog(context) {
    newPlaylistController.clear();
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(43, 0, 50, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text(
            'Create new playlist',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              autofocus: true,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: newPlaylistController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
                label: const Text(
                  'Playlist Name',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
              ///////////////////-------------Name Validation---------------------//////////////////////

              validator: (value) {
                bool check = PlaylistDb().playlistnameCheck(value);
                if (value == '') {
                  return 'Enter playlist name';
                } else if (check) {
                  return '$value already exist';
                } else {
                  return null;
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: (() {
                return Navigator.of(context).pop();
              }),
              child: const Text(
                'cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final name = newPlaylistController.text.trimLeft();
                  if (name.isEmpty) {
                    return;
                  } else {
                    final music = AudioPlayer(name: name, songId: []);

                    PlaylistDb.playlistAdd(music);
                    newPlaylistController.clear();
                  }
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(
                Icons.playlist_add,
                color: Colors.white,
              ),
              label: const Text(
                'create',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
