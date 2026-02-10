import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiss_army_component/widgets/apptext.dart';
import '../utils/utils.dart';
 
class KoraSnackbar {
  /// Show an error snackbar
  static void showError({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final isDark = Get.isDarkMode;
    Get.snackbar(
      '',
      '',
      duration: duration,
      backgroundColor:
          isDark
              ? AppColours.red.withValues( alpha: 0.2)
              : AppColours.red.withValues( alpha: 0.05),
      borderColor: AppColours.red,
      borderWidth: 1,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      borderRadius: 12,
      titleText: MedAppText(
        title,
        color: AppColours.red,
        fontWeight: FontWeight.bold,
      ),
      messageText: SmallAppText(
        message,
        color: isDark ? AppColours.white : AppColours.black,
        maxLines: 3,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  /// Show a success snackbar
  static void showSuccess({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final isDark = Get.isDarkMode;
    Get.snackbar(
      '',
      '',
      duration: duration,
      backgroundColor:
          isDark
              ? AppColours.green.withValues( alpha: 0.2)
              : AppColours.green.withValues( alpha: 0.1),
      borderColor: AppColours.green,
      borderWidth: 1,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      borderRadius: 12,
      titleText: MedAppText(
        title,
        color: AppColours.green,
        fontWeight: FontWeight.bold,
      ),
      messageText: SmallAppText(
        message,
        color: isDark ? AppColours.white : AppColours.black,
        maxLines: 3,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  /// Show an info snackbar
  static void showInfo({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final isDark = Get.isDarkMode;
    Get.snackbar(
      '',
      '',
      duration: duration,
      backgroundColor:
          isDark
              ? AppColours.primary.withValues(alpha: 0.2)
              : AppColours.primary.withValues(alpha: 0.1),
      borderColor: AppColours.primary,
      borderWidth: 1,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      borderRadius: 12,
      titleText: MedAppText(
        title,
        color: AppColours.primary,
        fontWeight: FontWeight.bold,
      ),
      messageText: SmallAppText(
        message,
        color: isDark ? AppColours.white : AppColours.black,
        maxLines: 3,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }
}
