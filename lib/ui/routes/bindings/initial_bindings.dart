import 'package:get/get.dart';

import '../../../services/car_entries_service.dart';

class InitialBindings extends Bindings {
  void dependencies() => Get.put<CarEntriesService>(CarEntriesService());
}
