import 'package:flutter/material.dart' hide OutlinedButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/mock/car_brands.dart';
import '../../../../data/models/car_brand.dart';
import '../../../widgets/coloured_button.dart';
import '../../../widgets/outlined_button.dart';
import '../../../resources/resources.dart';
import '../../../widgets/text_selector_input.dart';
import '../../../widgets/text_input.dart';
import 'menu_button.dart';

class CarDetailsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(R.images.svg.car),
                    SizedBox(width: 9.5),
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    MenuButton(
                      onClick: _close,
                      assetPath: R.images.svg.close,
                    )
                  ],
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Text('foo')),
                    Expanded(child: Text('foo')),
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Expanded(child: Text('foo')),
                    Expanded(child: Text('foo')),
                  ],
                ),
                SizedBox(height: 24),
                ColouredButton(
                  onClick: () {},
                  message: 'Reserve',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _close() {
    Get.back();
  }
}
