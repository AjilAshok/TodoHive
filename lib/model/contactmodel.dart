import 'dart:convert';

import 'package:hive/hive.dart';
part 'contactmodel.g.dart';
@HiveType(typeId:0 )
class ContactModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  ContactModel({required this.age, required this.name});
}
