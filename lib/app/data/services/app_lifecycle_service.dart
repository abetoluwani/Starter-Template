import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class AppLifecycleService extends GetxService with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _initializeAppServices();
  }

  Future<void> _initializeAppServices() async {
    try {
      debugPrint('[AppLifecycleService] Initialization completed successfully');
    } catch (e) {
      debugPrint('[AppLifecycleService] Initialization error: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint('[Lifecycle] App resumed');
         break;
      case AppLifecycleState.paused:
        debugPrint('[Lifecycle] App paused');
        break;
      case AppLifecycleState.inactive:
        debugPrint('[Lifecycle] App inactive');
        break;
      case AppLifecycleState.detached:
        debugPrint('[Lifecycle] App detached');
        break;
      case AppLifecycleState.hidden:
        debugPrint('[Lifecycle] App hidden');
        break;
    }
  }

 

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
