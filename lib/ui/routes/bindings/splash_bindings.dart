import 'package:get/get.dart';

import '../../screens/splash/splash_screen_controller.dart';

class SplashBindings extends Bindings {
  void dependencies() => Get.put(SplashScreenController());
}
