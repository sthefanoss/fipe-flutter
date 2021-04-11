import 'package:flutter/foundation.dart';

@immutable
class CarEntry {
  const CarEntry({
    this.id,
    this.brand,
    this.yearModel,
    this.model,
    this.price,
  });

  final int id;
  final String brand;
  final String yearModel;
  final String model;
  final String price;

  factory CarEntry.fromJson(json) {
    return CarEntry(
      id: json['id'],
      brand: json['brand'],
      yearModel: json['year_model'],
      price: json['price'],
      model: json['model'],
    );
  }
}
