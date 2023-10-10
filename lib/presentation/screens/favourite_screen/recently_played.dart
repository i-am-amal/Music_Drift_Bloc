import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/infrastructure/db_services/db_recents.dart';
import 'package:music_drift/presentation/screens/favourite_screen/favourite_btn.dart';
import 'package:music_drift/presentation/screens/play_screen/play_screen.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: RecentsDb.recentSongs,
      builder:
          (BuildContext context, List<SongModel> recentData, Widget? child) {
        return Container(
          decoration: BoxDecoration(gradient: linearGradient()),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    RecentsDb.sortRecentSongs();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              elevation: 0,
              title: const Text(
                'Recently Played',
                style: TextStyle(
                    fontFamily: 'Iceberg',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ValueListenableBuilder(
                  valueListenable: RecentsDb.recentSongs,
                  builder:
                      (context, List<SongModel> recentData, Widget? child) {
                    return RecentsDb.recentSongs.value.isEmpty
                        ? const Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 600,
                                  child: Center(
                                    child: Text(
                                      'No Recent Songs',
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
                              valueListenable: RecentsDb.recentSongs,
                              builder: (BuildContext context,
                                  List<SongModel> recentsData, Widget? child) {
                                return ListView.builder(
                                  itemCount: recentsData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      onTap: () {
                                        RecentsDb.addRecents(
                                            recentsData[index]);
                                        RecentsDb.recentSongs.notifyListeners();

                                        MostPlayedDb.addMostlyPlayed(
                                            recentsData[index]);
                                        MostPlayedDb.mostPlayedSongs
                                            .notifyListeners();
                                        RecentsDb.recentSongs.notifyListeners();

                                        List<SongModel> recentlist = [
                                          ...recentsData
                                        ];
                                        ///////////////////-------------Songs Play---------------------//////////////////////
                                        GetSongs.audioPlayer.setAudioSource(
                                            GetSongs.createSongList(recentlist),
                                            initialIndex: index);

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) => PlayScreen(
                                                  audioPlayerSong: recentsData,
                                                )),
                                          ),
                                        );

                                        GetSongs.audioPlayer.play();
                                      },
                                      tileColor: const Color.fromARGB(
                                          9, 126, 126, 126),
                                      leading: QueryArtworkWidget(
                                        artworkBorder: BorderRadius.circular(5),
                                        id: recentsData[index].id,
                                        type: ArtworkType.AUDIO,
                                        nullArtworkWidget: const Image(
                                          image: AssetImage(
                                            "assets/images/music1.jpg",
                                          ),
                                          fit: BoxFit.fill,
                                          height: 45,
                                          width: 50,
                                        ),
                                      ),
                                      title: Text(
                                        recentsData[index].title,
                                        maxLines: 1,
                                      ),
                                      subtitle: Text(
                                        recentsData[index].artist!,
                                        maxLines: 1,
                                      ),
                                      textColor: Colors.white,
                                      ///////////////////-------------Trailing Fav---------------------//////////////////////
                                      trailing: FavouriteButton(
                                        song: recentsData[index],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

ConcatenatingAudioSource createSongList(List<SongModel> song) {
  List<AudioSource> source = [];
  for (var songs in song) {
    source.add(AudioSource.uri(Uri.parse(songs.uri!)));
  }
  return ConcatenatingAudioSource(children: source);
}
