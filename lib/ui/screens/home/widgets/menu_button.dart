import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({this.assetPath, this.onClick});

  final String assetPath;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}
