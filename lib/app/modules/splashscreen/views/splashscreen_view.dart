import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

import '../../../utils/utils.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isCompact = size.height < 720;

    return Scaffold(
      backgroundColor: AppColours.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isCompact ? 20 : 24,
            isCompact ? 32 : 48,
            isCompact ? 20 : 24,
            24,
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: controller.opacity.value,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 800),
                      scale: controller.scale.value,
                      curve: Curves.easeOutBack,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image(
                          //   image: AssetImage(AppImages.logo),
                          //   height: 60,
                          //   width: 60,
                          // ),
                          hSpace(10),
                          Text(
                            controller.displayedText.value,
                            style: TextStyle(
                              color: AppColours.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ClashGrotesk',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
