import 'package:expense_tracker/screen/home/views/home_screen.dart';
import 'package:get/get.dart';

import '../screen/home/bindings/home_bindings.dart';
import '../screen/splash_screen.dart';

class ApplicationPages {
  static const splashScreen = '/';
  static const homeScreen = '/homeScreen';

  static List<GetPage>? getApplicationPages() => [
        GetPage(
          name: splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: homeScreen,
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
      ];
}


