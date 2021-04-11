import 'package:flutter/material.dart';

import '../resources/resources.dart';

class ColouredButton extends StatelessWidget {
  const ColouredButton({
    this.message,
    this.onClick,
    this.color = const Color(0xFF000000),
  });

  final String message;
  final VoidCallback onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 1,
      type: MaterialType.button,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: R.textThemes.button,
          ),
        ),
      ),
    );
  }
}
