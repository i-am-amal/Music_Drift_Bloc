import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_drift/infrastructure/db_services/db_playlist.dart';
import 'package:music_drift/presentation/screens/playlist_screen/playlist_dialogue_add.dart';
import 'package:music_drift/presentation/screens/playlist_screen/playlist_songs_add_view.dart';
import 'package:music_drift/widgets/bg.dart';
import '../../../domain/model/audio_player.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});

  late final AudioPlayer playlist;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<AudioPlayer>('playlistDB').listenable(),
        builder: (context, Box<AudioPlayer> musicList, Widget? child) {
          return Container(
            decoration: BoxDecoration(gradient: linearGradient()),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text(
                  ' Playlist',
                  style: TextStyle(
                      fontFamily: 'Iceberg',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      letterSpacing: 3,
                      fontStyle: FontStyle.italic),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      DialogList.addPlaylistDialog(context);
                    },
                    icon: const Icon(
                      Icons.playlist_add_rounded,
                    ),
                    iconSize: 30,
                  )
                ],
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Hive.box<AudioPlayer>('playlistDB').isEmpty
                      ? const SizedBox(
                          height: 600,
                          child: Center(
                            child: Text(
                              'No playlists added',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ),
                        )
                      ///////////////////-------------Playlist ListBuilding ---------------------//////////////////////

                      : SingleChildScrollView(
                          child: ValueListenableBuilder(
                            valueListenable: Hive.box<AudioPlayer>('playlistDB')
                                .listenable(),
                            builder: (BuildContext context,
                                Box<AudioPlayer> musicList, Widget? child) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: musicList.length,
                                itemBuilder: ((context, index) {
                                  final data = musicList.values.toList()[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 15),
                                    child: Center(
                                      child: SizedBox(
                                        height: 60,
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          tileColor: const Color.fromARGB(
                                              167, 43, 0, 50),
                                          leading: const Icon(
                                            Icons.my_library_music_rounded,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          title: Text(
                                            data.name,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ///////////////////------------Edit Playlist Page Name---------------------//////////////////////

                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          final newPlaylistController =
                                                              TextEditingController(
                                                                  text: data
                                                                      .name);
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                const Color
                                                                        .fromRGBO(
                                                                    43,
                                                                    0,
                                                                    50,
                                                                    1),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            title: const Text(
                                                              'Edit playlist name',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                            ),
                                                            content: Form(
                                                              key: _formKey,
                                                              child:
                                                                  TextFormField(
                                                                autofocus: true,
                                                                cursorColor:
                                                                    Colors
                                                                        .white,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                                controller:
                                                                    newPlaylistController,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                decoration:
                                                                    InputDecoration(
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Colors.white),
                                                                  ),
                                                                  label:
                                                                      const Text(
                                                                    'Playlist Name',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white70,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  bool check =
                                                                      PlaylistDb()
                                                                          .playlistnameCheck(
                                                                              value);
                                                                  if (value ==
                                                                      '') {
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
                                                                  return Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                }),
                                                                child:
                                                                    const Text(
                                                                  'cancel',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ),
                                                              TextButton.icon(
                                                                onPressed: () {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    final name =
                                                                        newPlaylistController
                                                                            .text
                                                                            .trimLeft();
                                                                    if (name
                                                                        .isEmpty) {
                                                                      return;
                                                                    } else {
                                                                      final music = AudioPlayer(
                                                                          name:
                                                                              name,
                                                                          songId: []);

                                                                      PlaylistDb.playlistUpdate(
                                                                          music,
                                                                          index);
                                                                      newPlaylistController
                                                                          .clear();
                                                                    }
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  }
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .edit_note_sharp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                label:
                                                                    const Text(
                                                                  'confirm',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit_note_rounded,
                                                    size: 25,
                                                    color: Colors.white,
                                                  )),
                                              ///////////////////-------------Delete Section ---------------------//////////////////////

                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete_sweep_rounded,
                                                  size: 25,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              const Color
                                                                      .fromRGBO(
                                                                  43, 0, 50, 1),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          title: const Text(
                                                            'Delete Playlist',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15),
                                                          ),
                                                          content: const Text(
                                                            'Are you sure you want to delete this playlist?',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                'No',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                'Yes',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                musicList
                                                                    .deleteAt(
                                                                        index);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) {
                                                return PlaylistAddSongs(
                                                  playlist: data,
                                                  folderindex: index,
                                                );
                                              },
                                            ));
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                ]),
              ),
            ),
          );
        });
  }
}

///////////////////-------------Playlist Page ---------------------//////////////////////

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController newPlaylistController = TextEditingController();
