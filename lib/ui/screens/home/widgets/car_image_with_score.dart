import 'package:flutter/material.dart';

import '../../../widgets/star_score_row.dart';
import '../../../resources/resources.dart';

class CarImageWithScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset(
            R.images.jpg.carExample,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: StarScoreRow(),
        ),
      ],
    );
  }
}
