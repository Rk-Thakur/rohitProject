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
      name: fields[0] as String?,
      family_name: fields[1] as String?,
      permanent_address: fields[2] as String?,
      residential_address: fields[3] as String?,
      personal_number: fields[4] as String?,
      office_number: fields[5] as String?,
      dateOfBirth: fields[6] as String?,
      nationality: fields[7] as String?,
      father_name: fields[8] as String?,
      mother_name: fields[9] as String?,
      religion: fields[10] as String?,
      blood_group: fields[11] as String?,
      email: fields[12] as String?,
      marital_status: fields[13] as String?,
      passport_number: fields[14] as String?,
      validityofvisa: fields[15] as String?,
      currentvisatype: fields[16] as String?,
      visatype: fields[17] as String?,
      visaduration: fields[18] as String?,
      visato: fields[19] as String?,
      working_organization: fields[20] as String?,
      remarks: fields[21] as String?,
      degree: fields[22] as String?,
      university: fields[23] as String?,
      division: fields[24] as String?,
      passedyear: fields[25] as String?,
      nameOfOrganization: fields[26] as String?,
      addressOfOrganization: fields[27] as String?,
      designation: fields[28] as String?,
      contactNumberOfOrganization: fields[29] as String?,
      contactEmailOfOrganization: fields[30] as String?,
      focalPersonOfOrganization: fields[31] as String?,
      telephone: fields[32] as String?,
      passport_id: fields[33] as int?,
      referenceName: fields[34] as String?,
      referenceNumber: fields[35] as String?,
      image: fields[36] as String?,
      dateofissues: fields[37] as String?,
      dateofexpiry: fields[38] as String?,
      passportcheckoutdate: fields[40] as String?,
      passportreceiveddate: fields[39] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PassportModel obj) {
    writer
      ..writeByte(41)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.family_name)
      ..writeByte(2)
      ..write(obj.permanent_address)
      ..writeByte(3)
      ..write(obj.residential_address)
      ..writeByte(4)
      ..write(obj.personal_number)
      ..writeByte(5)
      ..write(obj.office_number)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.nationality)
      ..writeByte(8)
      ..write(obj.father_name)
      ..writeByte(9)
      ..write(obj.mother_name)
      ..writeByte(10)
      ..write(obj.religion)
      ..writeByte(11)
      ..write(obj.blood_group)
      ..writeByte(12)
      ..write(obj.email)
      ..writeByte(13)
      ..write(obj.marital_status)
      ..writeByte(14)
      ..write(obj.passport_number)
      ..writeByte(15)
      ..write(obj.validityofvisa)
      ..writeByte(16)
      ..write(obj.currentvisatype)
      ..writeByte(17)
      ..write(obj.visatype)
      ..writeByte(18)
      ..write(obj.visaduration)
      ..writeByte(19)
      ..write(obj.visato)
      ..writeByte(20)
      ..write(obj.working_organization)
      ..writeByte(21)
      ..write(obj.remarks)
      ..writeByte(22)
      ..write(obj.degree)
      ..writeByte(23)
      ..write(obj.university)
      ..writeByte(24)
      ..write(obj.division)
      ..writeByte(25)
      ..write(obj.passedyear)
      ..writeByte(26)
      ..write(obj.nameOfOrganization)
      ..writeByte(27)
      ..write(obj.addressOfOrganization)
      ..writeByte(28)
      ..write(obj.designation)
      ..writeByte(29)
      ..write(obj.contactNumberOfOrganization)
      ..writeByte(30)
      ..write(obj.contactEmailOfOrganization)
      ..writeByte(31)
      ..write(obj.focalPersonOfOrganization)
      ..writeByte(32)
      ..write(obj.telephone)
      ..writeByte(33)
      ..write(obj.passport_id)
      ..writeByte(34)
      ..write(obj.referenceName)
      ..writeByte(35)
      ..write(obj.referenceNumber)
      ..writeByte(36)
      ..write(obj.image)
      ..writeByte(37)
      ..write(obj.dateofissues)
      ..writeByte(38)
      ..write(obj.dateofexpiry)
      ..writeByte(39)
      ..write(obj.passportreceiveddate)
      ..writeByte(40)
      ..write(obj.passportcheckoutdate);
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
