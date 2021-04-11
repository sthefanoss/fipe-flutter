import 'package:flutter/material.dart' hide OutlinedButton;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/models/car_entry.dart';
import '../../../widgets/coloured_button.dart';
import '../../../widgets/outlined_button.dart';
import '../../../resources/resources.dart';
import '../../../widgets/text_selector_input.dart';
import '../../../widgets/text_input.dart';
import '../home_screen_controller.dart';
import 'car_image_with_score.dart';
import 'menu_button.dart';

class CarEditorModal extends StatefulWidget {
  @override
  _CarEditorModalState createState() => _CarEditorModalState();
}

class _CarEditorModalState extends State<CarEditorModal> {
  final _screenController = Get.find<HomeScreenController>();
  final _brandTextController = TextEditingController(text: '');
  final _modelController = TextEditingController(text: '');
  final _yearModelController = TextEditingController(text: '');
  final _priceController = TextEditingController(text: '');
  bool _isEditing;
  int _index;
  int _entryId;

  @override
  void initState() {
    _index = Get.arguments;
    _isEditing = _index != null;

    if (_isEditing) {
      final _carEntry = _screenController.entries[_index];
      _brandTextController.text = _carEntry.brand;
      _modelController.text = _carEntry.model;
      _yearModelController.text = _carEntry.yearModel;
      _priceController.text = _carEntry.price;
      _entryId = _carEntry.id;
    }

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
                  CarImageWithScore(),
                  SizedBox(height: 13),
                  TextSelectorInput(
                    hintText: 'Brand',
                    controller: _brandTextController,
                    onSuggestionSelected: (String value) {
                      _brandTextController.text = value;
                      _screenController.selectCarBrand(value);
                    },
                    suggestionsCallback: () async {
                      await _screenController.fetchCarBrands();
                      return _screenController.carBrands.keys.toList();
                    },
                  ),
                  SizedBox(height: 13),
                  TextSelectorInput(
                    hintText: 'Model',
                    controller: _modelController,
                    onSuggestionSelected: (String value) {
                      _modelController.text = value;
                      _screenController.selectCarModel(value);
                    },
                    suggestionsCallback: () async {
                      await _screenController.fetchCarModels();
                      return _screenController.carModels.keys.toList();
                    },
                  ),
                  SizedBox(height: 13),
                  TextSelectorInput(
                    hintText: 'Year Model',
                    controller: _yearModelController,
                    onSuggestionSelected: (String value) async {
                      _yearModelController.text = value;
                      _screenController.selectCarYearModel(value);
                      _priceController.text =
                          await _screenController.fetchCarFullInformation();
                    },
                    suggestionsCallback: () async {
                      await _screenController.fetchCarYearModels();
                      return _screenController.carYearModels.keys.toList();
                    },
                  ),
                  SizedBox(height: 13),
                  TextInput(
                    hintText: 'Value (R\$)',
                    controller: _priceController,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onClick: _close,
                        message: 'Cancel',
                      ),
                      SizedBox(width: 8),
                      ColouredButton(
                        onClick: () {
                          final formData = CarEntry(
                            id: _entryId ??
                                DateTime.now().millisecondsSinceEpoch,
                            brand: _brandTextController.text,
                            model: _modelController.text,
                            yearModel: _yearModelController.text,
                            price: _priceController.text,
                          );

                          if (_isEditing) {
                            _screenController.editEntry(_index, formData);
                            Get.back();
                            return;
                          }

                          _screenController.saveEntry(formData);
                          Get.back();
                        },
                        message: 'Save',
                      ),
                    ],
                  )
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
