import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:music_drift/applications/playscreen/playscreen_bloc.dart';
import 'package:music_drift/infrastructure/db_services/db_fav.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/infrastructure/db_services/db_recents.dart';
import 'package:music_drift/presentation/screens/favourite_screen/favourite_btn.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:music_drift/widgets/bottom_sheet.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    Key? key,
    required this.audioPlayerSong,
  }) : super(key: key);

  final List<SongModel> audioPlayerSong;

  @override
  State<PlayScreen> createState() => _MiniPlayerState();
}

ValueNotifier<List<SongModel>> playingSongNotifier = ValueNotifier([]);

class _MiniPlayerState extends State<PlayScreen> {
  @override
  void initState() {
    GetSongs.audioPlayer.currentIndexStream.listen((index) {
      if (index != null && mounted) {
        BlocProvider.of<PlayscreenBloc>(context)
            .add(PlayscreenEvent.currentIndex(index: index));
        GetSongs.currentIndexes = index;
      }
    });

    super.initState();
    sliderFuntion();
  }

  void sliderFuntion() {
    GetSongs.audioPlayer.durationStream.listen((time) {
      BlocProvider.of<PlayscreenBloc>(context)
          .add(PlayscreenEvent.setTime(time: time!));
    });
    GetSongs.audioPlayer.positionStream.listen((pos) {
      BlocProvider.of<PlayscreenBloc>(context)
          .add(PlayscreenEvent.setPosition(position: pos));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: linearGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 100,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Now Playing',
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
              GetSongs.audioPlayer.play();
              FavouriteDb.favouriteSongs.notifyListeners();
            }),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 25,
            ),
          ),
        ),
        body: BlocBuilder<PlayscreenBloc, PlayscreenState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: QueryArtworkWidget(
                      artworkBorder: const BorderRadius.all(Radius.zero),
                      type: ArtworkType.AUDIO,
                      keepOldArtwork: true,
                      artworkFit: BoxFit.fill,
                      quality: 100,
                      artworkClipBehavior: Clip.antiAliasWithSaveLayer,
                      id: widget.audioPlayerSong[state.currentIndex].id,
                      nullArtworkWidget: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: Lottie.asset(
                            'assets/lottie/pink-astronaut-music.json'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextScroll(
                          widget.audioPlayerSong[GetSongs.currentIndexes].title,
                          velocity:
                              const Velocity(pixelsPerSecond: Offset(25, 0)),
                          style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.audioPlayerSong[GetSongs.currentIndexes].artist
                                      .toString() ==
                                  '<Unknown>'
                              ? "Unknown Artist?"
                              : widget.audioPlayerSong[GetSongs.currentIndexes]
                                  .artist
                                  .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            BottomSheetWidget().bottomSheet(
                                context,
                                state.currentIndex,
                                widget.audioPlayerSong[state.currentIndex]);
                          },
                          icon: const Icon(Icons.playlist_add),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        FavouriteButton(
                          song: widget.audioPlayerSong[state.currentIndex],
                        ),
                      ],
                    ),
                  ),
                  ///////////////////-------------Slider Function---------------------//////////////////////

                  Slider(
                      thumbColor: const Color.fromARGB(79, 250, 245, 245),
                      activeColor: const Color.fromARGB(255, 226, 226, 226),
                      inactiveColor: const Color.fromARGB(85, 218, 218, 218),
                      value: state.position.inSeconds.toDouble(),
                      min: const Duration(microseconds: 0).inSeconds.toDouble(),
                      max: state.duration.inSeconds.toDouble(),
                      onChanged: ((value) {
                        changeToSeconds(value.toInt());
                      })),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.position
                              .toString()
                              .substring(2, 7)
                              .split('.')[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          state.duration
                              .toString()
                              .substring(2, 7)
                              .split('.')[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          GetSongs.audioPlayer.shuffleModeEnabled
                              ? GetSongs.audioPlayer
                                  .setShuffleModeEnabled(false)
                              : GetSongs.audioPlayer
                                  .setShuffleModeEnabled(true);
                        },
                        icon: StreamBuilder(
                          stream: GetSongs.audioPlayer.shuffleModeEnabledStream,
                          builder: (context, snapshot) {
                            if (GetSongs.audioPlayer.shuffleModeEnabled) {
                              return const Icon(
                                Icons.shuffle,
                                color: Colors.white,
                                size: 25,
                              );
                            } else {
                              return const Icon(
                                Icons.shuffle,
                                size: 25,
                                color: Color.fromARGB(90, 255, 255, 255),
                              );
                            }
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ///////////////////-------------Database Adding---------------------//////////////////////

                          RecentsDb.addRecents(
                              widget.audioPlayerSong[state.currentIndex]);
                          RecentsDb.recentSongs.notifyListeners();
                          MostPlayedDb.addMostlyPlayed(
                              widget.audioPlayerSong[state.currentIndex]);
                          MostPlayedDb.mostPlayedSongs.notifyListeners();

                          if (GetSongs.audioPlayer.hasPrevious) {
                            GetSongs.audioPlayer.seekToPrevious();
                            GetSongs.audioPlayer.play();
                          } else {
                            GetSongs.audioPlayer.play();
                          }
                        },
                        icon: const Icon(
                          Icons.skip_previous_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        iconSize: 50,
                        icon: StreamBuilder(
                            stream: GetSongs.audioPlayer.playingStream,
                            builder: (context, snapshot) {
                              bool? playing = snapshot.data;
                              if (playing != null && playing) {
                                return const Icon(
                                  Icons.pause,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 45,
                                );
                              } else {
                                return const Icon(
                                  Icons.play_arrow,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 45,
                                );
                              }
                            }),
                        onPressed: (() async {
                          if (GetSongs.audioPlayer.playing) {
                            await GetSongs.audioPlayer.pause();
                            // setState(() {});
                          } else {
                            await GetSongs.audioPlayer.play();
                            // setState(() {});
                          }
                        }),
                      ),
                      IconButton(
                        onPressed: () async {
                          ///////////////////-------------Database Adding---------------------//////////////////////

                          RecentsDb.addRecents(
                              widget.audioPlayerSong[state.currentIndex]);
                          RecentsDb.recentSongs.notifyListeners();
                          MostPlayedDb.addMostlyPlayed(
                              widget.audioPlayerSong[state.currentIndex]);
                          MostPlayedDb.mostPlayedSongs.notifyListeners();

                          if (GetSongs.audioPlayer.hasNext) {
                            await GetSongs.audioPlayer.seekToNext();
                            await GetSongs.audioPlayer.play();
                          } else {
                            await GetSongs.audioPlayer.play();
                          }
                        },
                        icon: const Icon(
                          Icons.skip_next_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: (() {
                          GetSongs.audioPlayer.loopMode == LoopMode.one
                              ? GetSongs.audioPlayer.setLoopMode(LoopMode.all)
                              : GetSongs.audioPlayer.setLoopMode(LoopMode.one);
                        }),
                        icon: StreamBuilder<LoopMode>(
                          stream: GetSongs.audioPlayer.loopModeStream,
                          builder: (context, item) {
                            final loopMode = item.data;
                            if (LoopMode.one == loopMode) {
                              return const Icon(
                                Icons.repeat,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 25,
                              );
                            } else {
                              return const Icon(
                                Icons.repeat,
                                size: 25,
                                color: Color.fromARGB(90, 255, 255, 255),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}

void changeToSeconds(int seconds) {
  Duration duration = Duration(seconds: seconds);
  GetSongs.audioPlayer.seek(duration);
}
