import 'package:flutter/foundation.dart';

@immutable
class CarYearModel {
  const CarYearModel({
    this.key,
    this.name,
    this.id,
    this.fipeCode,
    this.vehicle,
  });

  final String key;
  final String name;
  final String id;
  final String fipeCode;
  final String vehicle;

  factory CarYearModel.fromJson(json) {
    return CarYearModel(
      key: json['key'],
      name: json['name'],
      id: json['id'],
      fipeCode: json['fipe_codigo'],
      vehicle: json['veiculo'],
    );
  }
}
