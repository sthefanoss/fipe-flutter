import 'package:get/get.dart';

import '../../screens/home/home_screen_controller.dart';

class HomeBindings extends Bindings {
  void dependencies() => Get.put(HomeScreenController());
}
