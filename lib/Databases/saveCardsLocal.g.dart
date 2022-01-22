// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saveCardsLocal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveCardsLocalAdapter extends TypeAdapter<SaveCardsLocal> {
  @override
  final int typeId = 0;

  @override
  SaveCardsLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveCardsLocal(
      details: fields[0] as String?,
      saveDate: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SaveCardsLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.details)
      ..writeByte(1)
      ..write(obj.saveDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveCardsLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
