// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_play.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostPlayAdapter extends TypeAdapter<MostPlay> {
  @override
  final int typeId = 2;

  @override
  MostPlay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostPlay(
      songId: fields[1] as int,
      count: fields[2] as int?,
      index: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MostPlay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.songId)
      ..writeByte(2)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostPlayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
