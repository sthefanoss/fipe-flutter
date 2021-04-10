import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    _navigateToHomeScreenWithDelay(
      Duration(seconds: kDebugMode ? 1 : 3),
    );

    super.onInit();
  }

  Future<void> _navigateToHomeScreenWithDelay(Duration delay) async {
    final initialTime = DateTime.now();
    await _initializeDatabase();
    final timeDifference = DateTime.now().difference(initialTime);

    if (timeDifference > delay) {
      Get.offAllNamed(RouteNames.home);
      return;
    }

    await Future.delayed(timeDifference);
    Get.offAllNamed(RouteNames.home);
  }

  Future<void> _initializeDatabase() async {
    //TODO implement database initialization
  }
}
