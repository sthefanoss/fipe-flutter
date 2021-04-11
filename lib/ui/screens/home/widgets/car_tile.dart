import 'package:flutter/material.dart';

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
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                carEntry.yearModel,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF595959),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'View More',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF00ADEE),
                  fontWeight: FontWeight.w300,
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
