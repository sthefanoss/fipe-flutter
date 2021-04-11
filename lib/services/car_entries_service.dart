import 'package:get/get.dart';

import '../data/models/car_entry.dart';

class CarEntriesService extends GetxService {
  final entries = RxList<CarEntry>([]);

  void save(CarEntry entry) {
    entries.add(entry);
  }

  void deleteAt(int index) {
    entries.removeAt(index);
  }

  void edit(int index, CarEntry newValue) {
    entries[index] = newValue;
  }
}
