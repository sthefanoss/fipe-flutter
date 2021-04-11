import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'car_tile.dart';
import 'car_details_modal.dart';
import 'car_editor_modal.dart';

class CarListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: 1000,
      itemBuilder: _carTileBuilder,
    );
  }

  Widget _carTileBuilder(BuildContext context, int index) {
    return Column(
      children: [
        Divider(color: Colors.black, height: 1),
        CarTile(
          actions: {
            CarTileAction.View: () => Get.dialog(CarDetailsModal()),
            CarTileAction.Edit: () => Get.dialog(CarEditorModal()),
            //TODO
            CarTileAction.Delete: () => print('delete $index'),
          },
        ),
      ],
    );
  }
}
