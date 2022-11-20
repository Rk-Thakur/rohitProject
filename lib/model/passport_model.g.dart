// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassportModelAdapter extends TypeAdapter<PassportModel> {
  @override
  final int typeId = 1;

  @override
  PassportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassportModel(
      passportNumber: fields[0] as String?,
      name: fields[1] as String?,
      address: fields[2] as String?,
      visaNumber: fields[3] as String?,
      visaExpiry: fields[4] as String?,
      created_date: fields[5] as DateTime?,
      passport_id: fields[6] as int?,
      image: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PassportModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.passportNumber)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.visaNumber)
      ..writeByte(4)
      ..write(obj.visaExpiry)
      ..writeByte(5)
      ..write(obj.created_date)
      ..writeByte(6)
      ..write(obj.passport_id)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
