import 'package:flutter/material.dart';

import '../../widgets/mob_car_logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MobCarLogo(width: 120)),
    );
  }
}
