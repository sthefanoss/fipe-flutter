import 'package:flutter/foundation.dart';

@immutable
class CarModel {
  CarModel({
    this.key,
    this.name,
    this.id,
    this.fipeName,
  });

  final String key;
  final String name;
  final String id;
  final String fipeName;

  factory CarModel.fromJson(json) {
    return CarModel(
      key: json['key'],
      name: json['name'],
      id: json['id'],
      fipeName: json['fipe_name'],
    );
  }
}
