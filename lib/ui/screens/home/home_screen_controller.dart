import 'package:get/get.dart';

import '../../../data/models/car_brand.dart';
import '../../../data/models/car_model.dart';
import '../../../data/models/car_year_model.dart';
import '../../../data/models/car_entry.dart';
import '../../../services/car_entries_service.dart';
import '../../../data/infra/http_client.dart';

class HomeScreenController extends GetxController {
  final _httpClient = HttpClient();
  final _carEntriesService = Get.find<CarEntriesService>();
  final carBrands = RxMap<String, CarBrand>({});
  final carModels = RxMap<String, CarModel>({});
  final carYearModels = RxMap<String, CarYearModel>({});

  final selectedCarBrand = Rx<CarBrand>(null);
  final selectedCarModel = Rx<CarModel>(null);
  final selectedCarYearModel = Rx<CarYearModel>(null);

  RxList<CarEntry> get entries => _carEntriesService.entries;

  @override
  void onInit() {
    super.onInit();
  }

  void saveEntry(CarEntry entry) {
    _carEntriesService.save(entry);
  }

  void deleteEntryAt(int index) {
    _carEntriesService.deleteAt(index);
  }

  void editEntry(int index, CarEntry newValue) {
    _carEntriesService.edit(index, newValue);
  }

  void selectCarBrand(String name) {
    selectedCarBrand.value = carBrands[name];
    selectedCarModel.value = null;
    selectedCarYearModel.value = null;
  }

  void selectCarModel(String name) {
    selectedCarModel.value = carModels[name];
    selectedCarYearModel.value = null;
  }

  void selectCarYearModel(String name) {
    selectedCarYearModel.value = carYearModels[name];
  }

  Future<void> fetchCarBrands() async {
    if (carBrands.isNotEmpty) return;

    try {
      final response = await _httpClient.get(
        'https://fipeapi.appspot.com/api/1/carros/marcas.json',
      );
      carBrands.value = _listToMapMapper<CarBrand>(
        response,
        (json) => CarBrand.fromJson(json),
      );
    } catch (e) {}
  }

  Future<void> fetchCarModels() async {
    if (selectedCarBrand.value == null) return;
    final String brandId = selectedCarBrand.value.id.toString();
    try {
      final response = await _httpClient.get(
        'https://fipeapi.appspot.com/api/1/carros/veiculos/$brandId.json',
      );
      carModels.value = _listToMapMapper<CarModel>(
        response,
        (json) => CarModel.fromJson(json),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchCarYearModels() async {
    if (selectedCarBrand.value == null) return;
    if (selectedCarModel.value == null) return;

    final String brandId = selectedCarBrand.value.id.toString();
    final String modelId = selectedCarModel.value.id.toString();

    try {
      final response = await _httpClient.get(
        'https://fipeapi.appspot.com/api/1/carros/veiculo/$brandId/$modelId.json',
      );

      carYearModels.value = _listToMapMapper<CarYearModel>(
        response,
        (json) => CarYearModel.fromJson(json),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<String> fetchCarFullInformation() async {
    final String brandId = selectedCarBrand.value.id.toString();
    final String modelId = selectedCarModel.value.id.toString();
    final String yearId = selectedCarYearModel.value.id.toString();

    final response = await _httpClient.get(
      'https://fipeapi.appspot.com/api/1/carros/veiculo/$brandId/$modelId/$yearId.json',
    );

    return response['preco'];
  }

  Map<String, T> _listToMapMapper<T>(List list, T Function(dynamic) mapper) {
    final List<MapEntry<String, T>> mapEntriesFromList = list
        .map<MapEntry<String, T>>((json) =>
            MapEntry<String, T>(json['name'].toString(), mapper(json)))
        .toList();
    return Map<String, T>.fromEntries(mapEntriesFromList);
  }
}
