import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/presentation/screens/favourite_screen/favourite_btn.dart';
import 'package:music_drift/presentation/screens/play_screen/play_screen.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MostlyPlayedScreen extends StatelessWidget {
  const MostlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: MostPlayedDb.mostPlayedSongs,
        builder: (BuildContext context, List<SongModel> mostPlayedData,
            Widget? child) {
          return Container(
            decoration: BoxDecoration(gradient: linearGradient()),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  'Mostly Played',
                  style: TextStyle(
                    fontFamily: 'Iceberg',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ValueListenableBuilder(
                      valueListenable: MostPlayedDb.mostPlayedSongs,
                      builder: (context, List<SongModel> mostPlayedData,
                          Widget? child) {
                        return MostPlayedDb.mostPlayedSongs.value.isEmpty
                            ? const Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 600,
                                      child: Center(
                                        child: Text(
                                          'No MostPlayed Songs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ValueListenableBuilder(
                                    valueListenable:
                                        MostPlayedDb.mostPlayedSongs,
                                    builder: (BuildContext context,
                                        List<SongModel> mostPlayedSongData,
                                        Widget? child) {
                                      return ListView.builder(
                                        itemCount: mostPlayedSongData.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            onTap: () {
                                              MostPlayedDb.mostPlayedSongs
                                                  .notifyListeners();

                                              List<SongModel> mostPlayedList = [
                                                ...mostPlayedSongData
                                              ];
                                              ///////////////////-------------songs playing---------------------//////////////////////
                                              GetSongs.audioPlayer
                                                  .setAudioSource(
                                                      GetSongs.createSongList(
                                                          mostPlayedList),
                                                      initialIndex: index);

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: ((context) =>
                                                      PlayScreen(
                                                        audioPlayerSong:
                                                            mostPlayedSongData,
                                                      )),
                                                ),
                                              );

                                              GetSongs.audioPlayer.play();
                                            },
                                            tileColor: const Color.fromARGB(
                                                9, 126, 126, 126),
                                            leading: QueryArtworkWidget(
                                              artworkBorder:
                                                  BorderRadius.circular(5),
                                              id: mostPlayedSongData[index].id,
                                              type: ArtworkType.AUDIO,
                                              nullArtworkWidget: const Image(
                                                image: AssetImage(
                                                    "assets/images/music1.jpg"),
                                                fit: BoxFit.fill,
                                                height: 45,
                                                width: 50,
                                              ),
                                            ),
                                            title: Text(
                                              mostPlayedSongData[index]
                                                  .displayNameWOExt,
                                              maxLines: 1,
                                            ),
                                            subtitle: Text(
                                              mostPlayedSongData[index].artist!,
                                              maxLines: 1,
                                            ),
                                            textColor: Colors.white,
                                            ///////////////////-------------Trailing Fav---------------------//////////////////////
                                            trailing: FavouriteButton(
                                                song:
                                                    mostPlayedSongData[index]),
                                          );
                                        },
                                      );
                                    }),
                              );
                      }),
                ),
              ),
            ),
          );
        });
  }
}

ConcatenatingAudioSource createSongList(List<SongModel> song) {
  List<AudioSource> source = [];
  for (var songs in song) {
    source.add(AudioSource.uri(Uri.parse(songs.uri!)));
  }
  return ConcatenatingAudioSource(children: source);
}
