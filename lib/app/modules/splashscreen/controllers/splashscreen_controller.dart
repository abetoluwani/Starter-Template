import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  final count = 0.obs;
  final opacity = 0.0.obs;
  final scale = 0.5.obs;
  final displayedText = "".obs;

  SplashscreenController();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 300), () {
      opacity.value = 1.0;
      scale.value = 1.0;
      _typeText("Detty Finance");
    });

    Future.delayed(const Duration(seconds: 3), () {
      _checkStateAndNavigate();
    });
  }

  void _checkStateAndNavigate() async {
    Get.offAllNamed(Routes.HOME);
  }

  void _typeText(String text) async {
    for (int i = 0; i < text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      displayedText.value += text[i];
    }
  }

  void increment() => count.value++;
}
