import 'package:flutter/material.dart';

class OutlinedButton extends StatelessWidget {
  const OutlinedButton({
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
      color: Colors.transparent,
      elevation: 0,
      type: MaterialType.button,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            message,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
