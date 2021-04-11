import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import '../../../../data/models/car_entry.dart';
import '../../../widgets/car_image.dart';

enum CarTileAction { View, Edit, Delete }

const Map<CarTileAction, String> _menuActions = const {
  CarTileAction.View: 'View',
  CarTileAction.Edit: 'Edit',
  CarTileAction.Delete: 'Delete',
};

class CarTile extends StatelessWidget {
  const CarTile({
    this.carEntry,
    this.actions,
  });

  final CarEntry carEntry;
  final Map<CarTileAction, VoidCallback> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.6, right: 8),
          child: ClipRRect(
            child: CarImage(
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${carEntry.brand} - ${carEntry.model}',
                style: R.textThemes.carTileTitle,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                carEntry.yearModel,
                style: R.textThemes.carTileSubtitle,
              ),
              SizedBox(height: 2),
              GestureDetector(
                onTap: () => actions[CarTileAction.View]?.call(),
                child: Text(
                  'View More',
                  style: R.textThemes.carTileButton,
                ),
              ),
            ],
          ),
        ),
        PopupMenuButton<CarTileAction>(
          itemBuilder: (context) => CarTileAction.values
              .map<PopupMenuItem<CarTileAction>>((CarTileAction action) =>
                  PopupMenuItem<CarTileAction>(
                      child: Text(_menuActions[action]), value: action))
              .toList(),
          onSelected: (CarTileAction action) {
            if (action == null) return;
            actions[action]?.call();
          },
        )
      ]),
    );
  }
}
