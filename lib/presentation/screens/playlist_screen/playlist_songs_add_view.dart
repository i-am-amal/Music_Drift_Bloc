
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_drift/infrastructure/db_services/db_playlist.dart';
import 'package:music_drift/presentation/screens/play_screen/play_screen.dart';
import 'package:music_drift/presentation/screens/playlist_screen/playlist_page_songs_view.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../domain/model/audio_player.dart';

// ignore: must_be_immutable
class PlaylistAddSongs extends StatelessWidget {
  PlaylistAddSongs(
      {Key? key, required this.playlist, required this.folderindex})
      : super(key: key);
  final AudioPlayer playlist;
  final int folderindex;

  late List<SongModel> playlistSong;

  @override
  Widget build(BuildContext context) {
    PlaylistDb.getAllPlaylist();

    return Container(
      decoration: BoxDecoration(gradient: linearGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Text(playlist.name),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlaylistViewPage(playlist: playlist),
                  ));
                },
                icon: const Icon(
                  Icons.add_sharp,
                  size: 35,
                ))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<AudioPlayer>('playlistDB').listenable(),
            builder:
                (BuildContext context, Box<AudioPlayer> value, Widget? child) {
              playlistSong =
                  listplaylist(value.values.toList()[folderindex].songId);

              return ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () async {
                      List<SongModel> newList = [...playlistSong];

                      GetSongs.audioPlayer.setAudioSource(
                          GetSongs.createSongList(newList),
                          initialIndex: index);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => PlayScreen(
                                audioPlayerSong: playlistSong,
                              )),
                        ),
                      );
                      GetSongs.audioPlayer.play();
                    },
                    leading: QueryArtworkWidget(
                      id: playlistSong[index].id,
                      type: ArtworkType.AUDIO,
                      artworkBorder: BorderRadius.circular(2),
                      size: 50,
                      artworkFit: BoxFit.fill,
                      quality: 100,
                      nullArtworkWidget: const Image(
                        image: AssetImage("assets/images/music1.jpg"),
                        fit: BoxFit.fill,
                        height: 45,
                        width: 50,
                      ),
                    ),
                    title: Text(
                      playlistSong[index].displayNameWOExt,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      playlistSong[index].artist!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        playlist.deleteData(playlistSong[index].id);
                        const snackbar = SnackBar(
                          backgroundColor: Colors.transparent,
                          content: Text(
                            '  Song Deleted',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 800),
                          behavior: SnackBarBehavior.floating,
                          width: 150,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      icon: const Icon(
                        Icons.delete_sweep,
                        color: Colors.red,
                      ),
                    ),
                  );
                }),
                itemCount: playlistSong.length,
                separatorBuilder: (context, index) => const Divider(),
              );
            },
          ),
        ),
      ),
    );
  }

  ///////////////////-------------Listing ---------------------//////////////////////

  List<SongModel> listplaylist(List<int> data) {
    List<SongModel> playsongs = [];
    for (int i = 0; i < GetSongs.songscopy.length; i++) {
      for (int j = 0; j < data.length; j++) {
        if (GetSongs.songscopy[i].id == data[j]) {
          playsongs.add(GetSongs.songscopy[i]);
        }
      }
    }
    return playsongs;
  }
}
