import 'package:hive/hive.dart';
part 'most_play.g.dart';

///////////////////-------------MostPlayed Model---------------------//////////////////////

@HiveType(typeId: 2)
class MostPlay extends HiveObject {
  @HiveField(0)
  int? index;
  @HiveField(1)
  int songId;
  @HiveField(2)
  int? count;

  MostPlay({
    required this.songId,
    this.count,
    this.index,
  });
}
