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

class CarEditorModal extends StatefulWidget {
  @override
  _CarEditorModalState createState() => _CarEditorModalState();
}

class _CarEditorModalState extends State<CarEditorModal> {
  List<CarBrand> _brands;
  final _brandTextController = TextEditingController(text: '');

  @override
  void initState() {
    _brands =
        carBrands.map<CarBrand>((json) => CarBrand.fromJson(json)).toList();
    super.initState();
  }

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
                TextSelectorInput(
                  hintText: 'Brand',
                  controller: _brandTextController,
                  suggestions:
                      _brands.map<String>((brand) => brand?.name).toList(),
                  onSuggestionSelected: (value) {
                    _brandTextController.text = value;
                  },
                ),
                SizedBox(height: 16),
                TextSelectorInput(hintText: 'Model'),
                SizedBox(height: 16),
                TextSelectorInput(
                  hintText: 'Model Year',
                ),
                SizedBox(height: 16),
                TextInput(hintText: 'Value (R\$)'),
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onClick: _close,
                      message: 'Cancel',
                    ),
                    SizedBox(width: 8),
                    ColouredButton(
                      onClick: () {},
                      message: 'Save',
                    ),
                  ],
                )
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
