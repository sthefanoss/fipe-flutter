import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/routes/routes.dart';

void main() => runApp(FipeFlutterApp());

class FipeFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FipeFlutter',
      getPages: routes,
    );
  }
}
