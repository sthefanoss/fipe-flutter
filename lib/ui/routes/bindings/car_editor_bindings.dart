import 'package:get/get.dart';

import '../../screens/car_editor/edit_car_screen_controller.dart';

class CarEditorBindings extends Bindings {
  void dependencies() => Get.put(CarEditorScreenController());
}
