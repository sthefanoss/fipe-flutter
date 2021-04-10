import 'package:get/get.dart';

import '../../ui/screens/car_details/car_details_screen.dart';
import '../../ui/screens/car_editor/edit_car_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';
import 'bindings/car_details_bindings.dart';
import 'bindings/car_editor_bindings.dart';
import 'bindings/home_bindings.dart';
import 'bindings/splash_bindings.dart';
export 'bindings/initial_bindings.dart';

class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const carDetails = '/car-details';
  static const carEditor = '/car-editor';
}

final routes = <GetPage>[
  GetPage(
    name: RouteNames.splash,
    page: () => SplashScreen(),
    binding: SplashBindings(),
  ),
  GetPage(
    name: RouteNames.home,
    page: () => HomeScreen(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: RouteNames.carDetails,
    page: () => CarDetailsScreen(),
    binding: CarDetailsBindings(),
  ),
  GetPage(
    name: RouteNames.carEditor,
    page: () => CarEditorScreen(),
    binding: CarEditorBindings(),
  ),
];
