// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_drift/applications/home/home_bloc.dart';
import 'package:music_drift/infrastructure/db_services/db_fav.dart';
import 'package:music_drift/infrastructure/db_services/db_mostplayed.dart';
import 'package:music_drift/infrastructure/db_services/db_recents.dart';
import 'package:music_drift/presentation/screens/favourite_screen/favourite_btn.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:music_drift/widgets/bottom_sheet.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:music_drift/widgets/miniplayer.dart';
import 'package:music_drift/widgets/text.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/home_screen_functions.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<SongModel> allSongs = [];
  final AudioPlayer audioPlayer = AudioPlayer();
  Icon playIcon = const Icon(Icons.play_arrow);
  final _audioQuery = OnAudioQuery();
  final _controller = TextEditingController();

  ///////////////////-------------Storage Permission---------------------//////////////////////

  @override
  Widget build(BuildContext context) {
    requestStoragePermission(context,_audioQuery);

    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 50,
                    ),
                    child: TextWidget(
                      title: 'Welcome To Music Drift!',
                      size: 28,
                      style: FontStyle.italic,
                      textColor: Colors.white,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: TextWidget(
                    title: 'What do you feel like today?',
                    size: 15,
                    style: FontStyle.normal,
                    textColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //---------------------------------- Search field starts----------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: false,
                    controller: _controller,
                    onChanged: (value) {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEvent.updateSearchText(value: value));
                    
                    },
                    style: const TextStyle(
                        color: Color.fromARGB(255, 188, 173, 173)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 79, 8, 50),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      hintText: "Search song, artist, title...",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 188, 173, 173)),
                      prefixIcon: const Icon(Icons.search,
                          color: Color.fromARGB(255, 188, 173, 173)),
                    ),
                  ),
                ),
                //------------------search field ends----------------------------

                const SizedBox(
                  height: 10,
                ),

                ///////////////////-------------Songs Fetching---------------------//////////////////////

                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return FutureBuilder<List<SongModel>>(
                      future: _audioQuery.querySongs(
                          sortType: null,
                          orderType: OrderType.ASC_OR_SMALLER,
                          uriType: UriType.EXTERNAL,
                          ignoreCase: true),
                      builder: (context, item) {
                        if (item.data == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (item.data!.isEmpty) {
                          return const Center(
                            child: Text(
                              'No songs Found',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  letterSpacing: 2),
                            ),
                          );
                        }

                        ///////////////////-------------Database Checking---------------------//////////////////////

                        if (!FavouriteDb.isfavourite) {
                          FavouriteDb.isFavourite(item.data!);
                        }

                        if (!RecentsDb.isRecent) {
                          RecentsDb.isRecentSong(item.data!);
                        }

                        if (!MostPlayedDb.isMostPlayed) {
                          MostPlayedDb.isMostlyPlayedSong(item.data!);
                        }

                        GetSongs.songscopy = item.data!;

                        ///////////////////------------- Search ---------------------//////////////////////

                        List<SongModel>? songData =
                            searchFromStringList(state.searchText, item.data);

                        if (state.searchText == "") {
                          songData = item.data;
                        }

                        if (songData!.isEmpty) {
                          return const Center(
                            child: Text(
                              'No songs Found',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                letterSpacing: 2,
                              ),
                            ),
                          );
                        }

                        return Expanded(
                          ///////////////////-------------Home Screen ListView---------------------//////////////////////

                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: songData.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ListTile(
                                  onTap: () async {
                                    ///////////////////-------------Adding Functions---------------------//////////////////////

                                    RecentsDb.addRecents(songData![index]);
                                    RecentsDb.recentSongs.notifyListeners();

                                    MostPlayedDb.addMostlyPlayed(
                                        songData[index]);
                                    MostPlayedDb.mostPlayedSongs
                                        .notifyListeners();

                                    ///////////////////-------------Play Song---------------------//////////////////////

                                    GetSongs.audioPlayer.setAudioSource(
                                        GetSongs.createSongList(songData),
                                        initialIndex: index);

                                    await ShowMiniPlayer.updateMiniPlayer(
                                        songlist: songData);

                                    await GetSongs.audioPlayer.play();
                                  },
                                  leading: QueryArtworkWidget(
                                    id: songData![index].id,
                                    type: ArtworkType.AUDIO,
                                    artworkBorder: BorderRadius.circular(1),
                                    artworkHeight: 45,
                                    artworkWidth: 50,
                                    artworkFit: BoxFit.fill,
                                    quality: 100,
                                    nullArtworkWidget: const Image(
                                      image: AssetImage(
                                          "assets/images/music1.jpg"),
                                      fit: BoxFit.fill,
                                      height: 45,
                                      width: 50,
                                    ),
                                  ),
                                  title: Text(
                                    songData[index]
                                            .displayNameWOExt
                                            .substring(0, 1)
                                            .toUpperCase() +
                                        songData[index]
                                            .displayNameWOExt
                                            .substring(1),
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    "${songData[index].artist}",
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            int id = item.data![index].id;

                                            BottomSheetWidget().bottomSheet(
                                                context, id, item.data![index]);
                                          },
                                          icon: const Icon(Icons.playlist_add)),
                                      FavouriteButton(song: item.data![index]),
                                    ],
                                  ),
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///////////////////-------------Search Function---------------------//////////////////////

  searchFromStringList(String query, stringList) {
    List suggestions = stringList.where((stringElement) {
      String findString = query.toLowerCase();
      final mainString = stringElement.toString().toLowerCase();
      return mainString.contains(findString);
    }).toList();

    return suggestions;
  }


  
}
