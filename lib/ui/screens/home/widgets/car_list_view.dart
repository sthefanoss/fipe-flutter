import 'package:flutter/material.dart';

import 'car_tile.dart';

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
        CarTile(),
      ],
    );
  }
}
