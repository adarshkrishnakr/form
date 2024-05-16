// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormModelAdapter extends TypeAdapter<FormModel> {
  @override
  final int typeId = 1;

  @override
  FormModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormModel(
      name: fields[0] as String,
      apartmentName: fields[1] as String,
      apartmentNo: fields[2] as String,
      vehicleCount: fields[3] as int,
      noOfSlots: fields[4] as int,
      selectedSlots: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FormModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.apartmentName)
      ..writeByte(2)
      ..write(obj.apartmentNo)
      ..writeByte(3)
      ..write(obj.vehicleCount)
      ..writeByte(4)
      ..write(obj.noOfSlots)
      ..writeByte(5)
      ..write(obj.selectedSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
