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
    await Future.delayed(delay);
    Get.offAllNamed(RouteNames.home);
  }
}
