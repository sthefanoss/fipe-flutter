import 'package:get/get.dart';

import '../../../services/cars_listing_service.dart';

class InitialBindings extends Bindings {
  void dependencies() => Get.put(CarListingService());
}
