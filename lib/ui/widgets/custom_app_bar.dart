import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.preferredSize = const Size.fromHeight(60),
    this.leading,
    this.trailing,
    this.color = const Color(0xFF000000),
  });

  final Size preferredSize;
  final Widget leading;
  final Widget trailing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxHeight: preferredSize.height),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ?? Container(),
                Spacer(),
                trailing ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
