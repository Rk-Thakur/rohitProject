// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'passport_model.g.dart';

@HiveType(typeId: 1)
// ignore: camel_case_types
class PassportModel {
  @HiveField(0)
  final String? passportNumber;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String? visaNumber;
  @HiveField(4)
  final String? visaExpiry;
  @HiveField(5)
  final DateTime? created_date;
  const PassportModel({
    this.passportNumber,
    this.name,
    this.address,
    this.visaNumber,
    this.visaExpiry,
    this.created_date,
  });
}
