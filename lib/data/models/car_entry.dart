import 'package:flutter/foundation.dart';

@immutable
class CarEntry {
  const CarEntry({
    this.brand,
    this.yearModel,
    this.model,
    this.price,
  });

  final String brand;
  final String yearModel;
  final String model;
  final String price;
}
