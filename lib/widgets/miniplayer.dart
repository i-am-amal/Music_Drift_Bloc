// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/infrastructure/db_services/db_recents.dart';
import 'package:music_drift/presentation/screens/play_screen/play_screen.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({
    super.key,
    required this.miniPlayerSong,
  });

  final List<SongModel> miniPlayerSong;

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {

    GetSongs.audioPlayer.currentIndexStream.listen((index) {
      if (index != null && mounted) {
        setState(() {});
        GetSongs.currentIndexes = index;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(96, 27, 68, 1),
            Color.fromRGBO(43, 0, 50, 1),
          ],
        ),
      ),
      child: Center(
        child: ListTile(
          leading: QueryArtworkWidget(
            artworkFit: BoxFit.fill,
            artworkBorder: BorderRadius.circular(5),
            id: widget.miniPlayerSong[GetSongs.currentIndexes].id,
            type: ArtworkType.AUDIO,
            nullArtworkWidget: const Image(
              image: AssetImage("assets/images/music1.jpg"),
              fit: BoxFit.fill,
              height: 45,
              width: 50,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(createRoute());
            GetSongs.audioPlayer.play();
          },
          title: TextScroll(
            GetSongs.playingSongs[GetSongs.currentIndexes].title,
            velocity: const Velocity(pixelsPerSecond: Offset(25, 0)),
            style: const TextStyle(
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      if (GetSongs.audioPlayer.playing) {
                        await GetSongs.audioPlayer.pause();
                        setState(() {});
                      } else {
                        await GetSongs.audioPlayer.play();
                        setState(() {});
                      }
                    },
                    icon: StreamBuilder<bool>(
                      stream: GetSongs.audioPlayer.playingStream,
                      builder: (context, snapshot) {
                        bool? playingStage = snapshot.data;
                        if (playingStage != null && playingStage) {
                          return const Icon(
                            Icons.pause,
                            size: 33,
                            color: Color.fromARGB(255, 255, 255, 255),
                          );
                        } else {
                          return const Icon(
                            Icons.play_arrow,
                            size: 35,
                            color: Color.fromARGB(255, 255, 255, 255),
                          );
                        }
                      },
                    )),
                IconButton(
                    onPressed: () async {
                      if (GetSongs.audioPlayer.hasNext) {
                        await GetSongs.audioPlayer.seekToNext();
                        await GetSongs.audioPlayer.play();

                        RecentsDb.addRecents(
                            GetSongs.playingSongs[GetSongs.currentIndexes]);
                        RecentsDb.recentSongs.notifyListeners();

                        MostPlayedDb.addMostlyPlayed(
                            GetSongs.playingSongs[GetSongs.currentIndexes]);
                        MostPlayedDb.mostPlayedSongs.notifyListeners();
                      } else {
                        await GetSongs.audioPlayer.play();
                      }
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      size: 35,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PlayScreen(audioPlayerSong: widget.miniPlayerSong),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class ShowMiniPlayer {
  static updateMiniPlayer({required List<SongModel> songlist}) {
    playingSongNotifier.value.clear();
    playingSongNotifier.value.addAll(songlist);
    playingSongNotifier.notifyListeners();
  }
}
