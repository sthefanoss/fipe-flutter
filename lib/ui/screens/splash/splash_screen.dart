import 'package:flutter/material.dart';

import '../../widgets/mob_car_logo.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MobCarLogo(width: 120)),
    );
  }
}
