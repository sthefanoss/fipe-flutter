import 'package:flutter/material.dart';

import '../resources/resources.dart';

class CarImage extends StatelessWidget {
  const CarImage({
    this.width,
    this.height,
    this.fit,
  });

  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      R.images.jpg.carExample,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
