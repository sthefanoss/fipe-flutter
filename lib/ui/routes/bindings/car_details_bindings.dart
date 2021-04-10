import 'package:get/get.dart';

import '../../screens/car_details/car_details_screen_controller.dart';

class CarDetailsBindings extends Bindings {
  void dependencies() => Get.put(CarDetailsScreenController());
}
