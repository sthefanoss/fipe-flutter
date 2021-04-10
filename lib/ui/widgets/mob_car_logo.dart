import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';

class MobCarLogo extends StatelessWidget {
  MobCarLogo({
    this.width,
    this.height,
    this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      R.images.logo,
      width: width,
      height: height,
      color: color,
    );
  }
}
