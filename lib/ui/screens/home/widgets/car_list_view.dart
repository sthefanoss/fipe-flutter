import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen_controller.dart';
import 'car_tile.dart';
import 'car_details_modal.dart';
import 'car_editor_modal.dart';

class CarListView extends StatelessWidget {
  final _screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: _screenController.entries.length,
        itemBuilder: _carTileBuilder,
      ),
    );
  }

  Widget _carTileBuilder(BuildContext context, int index) {
    return Column(
      children: [
        Divider(color: Colors.black, height: 1),
        CarTile(
          carEntry: _screenController.entries[index],
          actions: {
            CarTileAction.View: () =>
                Get.dialog(CarDetailsModal(), arguments: index),
            CarTileAction.Edit: () =>
                Get.dialog(CarEditorModal(), arguments: index),
            CarTileAction.Delete: () => _screenController.deleteEntryAt(index),
          },
        ),
      ],
    );
  }
}
