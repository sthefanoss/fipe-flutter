import 'package:flutter/foundation.dart';

@immutable
class CarBrand {
  const CarBrand({
    this.id,
    this.name,
    this.fipeName,
    this.order,
    this.key,
  });

  final int id;
  final String name;
  final String fipeName;
  final int order;
  final String key;

  factory CarBrand.fromJson(json) {
    return CarBrand(
      id: json['id'],
      name: json['name'],
      fipeName: json['fipe_name'],
      order: json['order'],
      key: json['key'],
    );
  }
}
