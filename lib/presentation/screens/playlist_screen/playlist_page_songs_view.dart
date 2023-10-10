import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_drift/applications/playscreen/playscreen_bloc.dart';
import 'package:music_drift/infrastructure/db_services/db_playlist.dart';
import 'package:music_drift/widgets/bg.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../domain/model/audio_player.dart';

class PlaylistViewPage extends StatelessWidget {
  PlaylistViewPage({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final AudioPlayer playlist;
  final audioQuery = OnAudioQuery();

  ///////////////////-------------Song Listing Page ---------------------//////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: linearGradient()),
      child: BlocBuilder<PlayscreenBloc, PlayscreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Add songs'),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: FutureBuilder<List<SongModel>>(
                ///////////////////-------------SongS fetching ---------------------//////////////////////

                future: audioQuery.querySongs(
                  sortType: SongSortType.TITLE,
                  orderType: OrderType.ASC_OR_SMALLER,
                  uriType: UriType.EXTERNAL,
                  ignoreCase: true,
                ),
                builder: (context, item) {
                  if (item.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  if (item.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Songs Found',
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((ctx, index) {
                      return ListTile(
                        leading: QueryArtworkWidget(
                          id: item.data![index].id,
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
                          item.data![index].displayNameWOExt,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${item.data![index].artist}',
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: (() {
                            ///////////////////-------------Playlist checking ---------------------//////////////////////

                            checkPlaylist(item.data![index], context);

                            PlaylistDb.playlistNotifier.notifyListeners();
                            BlocProvider.of<PlayscreenBloc>(context)
                                .add(const PlayscreenEvent.update());
                          }),
                          icon: !playlist.isValueIn(item.data![index].id)
                              ? const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                ),
                        ),
                      );
                    }),
                    itemCount: item.data!.length,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  ///////////////////-------------Adding, Deleting Song To Playlist Function ---------------------//////////////////////

  void checkPlaylist(SongModel data, context) {
    if (!playlist.isValueIn(data.id)) {
      playlist.add(data.id);
      const snackbar = SnackBar(
        backgroundColor: Colors.transparent,
        duration: Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        width: 200,
        content: Text(
          'Added to Playlist',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      playlist.deleteData(data.id);
      const snackbar = SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Song Deleted',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        width: 200,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
