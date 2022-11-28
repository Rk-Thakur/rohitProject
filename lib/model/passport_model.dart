// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

part 'passport_model.g.dart';

@HiveType(typeId: 1)
// ignore: camel_case_types
class PassportModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? family_name;
  @HiveField(2)
  final String? permanent_address;
  @HiveField(3)
  final String? residential_number;
  @HiveField(4)
  final String? personal_number;
  @HiveField(5)
  final String? office_number;
  @HiveField(6)
  final DateTime? dateOfBirth;
  @HiveField(7)
  final String? nationality;
  @HiveField(8)
  final String? father_name;
  @HiveField(9)
  final String? mother_name;
  @HiveField(10)
  final String? religion;
  @HiveField(11)
  final String? blood_group;
  @HiveField(12)
  final String? email;
  @HiveField(13)
  final String? marital_status;
  @HiveField(14)
  final String? passport_number;
  @HiveField(15)
  final String? validityofvisa;
  @HiveField(16)
  final String? currentvisatype;
  @HiveField(17)
  final String? visatype;
  @HiveField(18)
  final DateTime? visaduration;
  @HiveField(19)
  final DateTime? visato;
  @HiveField(20)
  final String? working_organization;
  @HiveField(21)
  final String? remarks;
  @HiveField(22)
  final String? degree;
  @HiveField(23)
  final String? university;
  @HiveField(24)
  final String? division;
  @HiveField(25)
  final DateTime? passedyear;
  @HiveField(26)
  final String? nameOfOrganization;
  @HiveField(27)
  final String? addressOfOrganization;
  @HiveField(28)
  final String? designation;
  @HiveField(29)
  final String? contactNumberOfOrganization;
  @HiveField(30)
  final String? contactEmailOfOrganization;
  @HiveField(31)
  final String? focalPersonOfOrganization;
  @HiveField(32)
  final String? telephone;
  @HiveField(33)
  final int? passport_id;
  @HiveField(34)
  final String? referenceName;
  @HiveField(35)
  final String? referenceNumber;
  @HiveField(36)
  final String? image;
  PassportModel({
    this.name,
    this.family_name,
    this.permanent_address,
    this.residential_number,
    this.personal_number,
    this.office_number,
    this.dateOfBirth,
    this.nationality,
    this.father_name,
    this.mother_name,
    this.religion,
    this.blood_group,
    this.email,
    this.marital_status,
    this.passport_number,
    this.validityofvisa,
    this.currentvisatype,
    this.visatype,
    this.visaduration,
    this.visato,
    this.working_organization,
    this.remarks,
    this.degree,
    this.university,
    this.division,
    this.passedyear,
    this.nameOfOrganization,
    this.addressOfOrganization,
    this.designation,
    this.contactNumberOfOrganization,
    this.contactEmailOfOrganization,
    this.focalPersonOfOrganization,
    this.telephone,
    this.passport_id,
    this.referenceName,
    this.referenceNumber,
    this.image,
  });
}
