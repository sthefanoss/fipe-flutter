import 'package:flutter/material.dart' hide OutlinedButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/models/car_entry.dart';
import '../../../widgets/coloured_button.dart';
import '../../../resources/resources.dart';
import '../home_screen_controller.dart';
import 'menu_button.dart';

class CarDetailsModal extends StatefulWidget {
  @override
  _CarDetailsModalState createState() => _CarDetailsModalState();
}

class _CarDetailsModalState extends State<CarDetailsModal> {
  final _screenController = Get.find<HomeScreenController>();
  CarEntry _carEntry;

  @override
  void initState() {
    final index = Get.arguments;
    _carEntry = _screenController.entries[index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: BoxConstraints(maxWidth: 686),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      Expanded(child: Text(_carEntry.brand)),
                      Expanded(child: Text(_carEntry.yearModel)),
                    ],
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Expanded(child: Text(_carEntry.model)),
                      Expanded(child: Text(_carEntry.price)),
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
      ),
    );
  }

  void _close() {
    Get.back();
  }
}
