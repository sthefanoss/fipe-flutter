import 'package:get/get.dart';

import '../data/infra/database_client.dart';
import '../data/models/car_entry.dart';

class CarEntriesService extends GetxService {
  final _dataBaseClient = DatabaseClient();
  final entries = RxList<CarEntry>([]);
  final isReady = Rx<bool>(false);

  @override
  Future<void> onInit() async {
    await _initDatabase();
    isReady.value = true;

    super.onInit();
  }

  Future<void> _initDatabase() async {
    await _dataBaseClient.query(
      'CREATE TABLE IF NOT EXISTS car_entries('
      'id INTEGER PRIMARY KEY, '
      'brand TEXT, '
      'model TEXT, '
      'year_model TEXT, '
      'price TEXT)',
    );

    final data =
        await _dataBaseClient.query('SELECT * FROM car_entries') as List;
    entries.addAll(data.map<CarEntry>((json) => CarEntry.fromJson(json)));
  }

  void save(CarEntry entry) {
    entries.add(entry);
    _dataBaseClient.query(
      'INSERT INTO car_entries('
      'id, '
      'brand, '
      'model, '
      'year_model, '
      'price) VALUES(?, ?, ?, ?, ?)',
      [
        entry.id,
        entry.brand,
        entry.model,
        entry.yearModel,
        entry.price,
      ],
    );
  }

  void deleteAt(int index) {
    final deletedEntry = entries.removeAt(index);
    _dataBaseClient.query(
      'DELETE FROM car_entries WHERE id = ?',
      [
        deletedEntry.id,
      ],
    );
  }

  void edit(int index, CarEntry newValue) {
    entries[index] = newValue;
    _dataBaseClient.query(
      'UPDATE car_entries SET '
      'brand = ?, '
      'model = ?, '
      'year_model = ?, '
      'price = ? WHERE id = ?',
      [
        newValue.brand,
        newValue.model,
        newValue.yearModel,
        newValue.price,
        newValue.id,
      ],
    );
  }
}
