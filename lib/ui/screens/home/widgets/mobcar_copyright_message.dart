import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/resources.dart';

class MobcarCopyrightMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(R.images.svg.copyrightSymbol),
        SizedBox(width: 13.5),
        Text(
          '2020. All rights reserved to Mobcar.',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF00ADEE)),
        )
      ],
    );
  }
}
