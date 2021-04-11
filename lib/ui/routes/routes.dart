import 'package:get/get.dart';

import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';
import 'bindings/home_bindings.dart';
import 'bindings/splash_bindings.dart';
export 'bindings/initial_bindings.dart';

class RouteNames {
  static const splash = '/';
  static const home = '/home';
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
];
