import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:music_drift/applications/bottomNavbar/navbar_bloc.dart';
import 'package:music_drift/widgets/get_songs.dart';
import 'package:music_drift/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:music_drift/infrastructure/db_services/db_fav.dart';
import 'package:music_drift/presentation/screens/home_screen/home_screen.dart';
import 'package:music_drift/presentation/screens/play_screen/play_screen.dart';
import 'package:music_drift/presentation/screens/playlist_screen/playlist_screen.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_screen.dart';
import 'package:music_drift/presentation/screens/favourite_screen/favourite_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final List<Widget> bottomNavOptions = <Widget>[
    HomeScreen(),
    FavouriteScreen(),
    PlaylistScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.selectedIndex,
            children: bottomNavOptions,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: playingSongNotifier,
            builder: (context, List<SongModel> music, Widget? child) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                if (GetSongs.audioPlayer.currentIndex != null)
                  ValueListenableBuilder(
                      valueListenable: playingSongNotifier,
                      builder: (BuildContext context, playingSong, child) {
                        return Miniplayer(
                          minHeight: 70,
                          maxHeight: 70,
                          builder: (height, percentage) {
                            return MiniPlayer(
                              miniPlayerSong: GetSongs.playingSongs,
                            );
                          },
                        );
                      }),
                const SizedBox.shrink(),
                CurvedNavigationBar(
                  backgroundColor: const Color.fromRGBO(43, 0, 50, 1),
                  color: const Color.fromARGB(255, 79, 8, 50),
                  height: 55,
                  items: const [
                    Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.playlist_play,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                  index: state.selectedIndex,
                  onTap: (index) {
                    BlocProvider.of<NavbarBloc>(context)
                        .add(NavbarEvent.updateNavbar(index: index));

                    FavouriteDb.favouriteSongs.notifyListeners();
                    playingSongNotifier.notifyListeners();
                  },
                ),
              ]);
            },
          ),
        );
      },
    );
  }
}
