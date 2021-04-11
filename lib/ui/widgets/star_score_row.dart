import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';

class StarScoreRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(R.images.svg.starFilled),
        SizedBox(width: 4),
        SvgPicture.asset(R.images.svg.starFilled),
        SizedBox(width: 4),
        SvgPicture.asset(R.images.svg.starFilled),
        SizedBox(width: 4),
        SvgPicture.asset(R.images.svg.starFilled),
        SizedBox(width: 4),
        SvgPicture.asset(R.images.svg.starEmpty),
      ],
    );
  }
}
