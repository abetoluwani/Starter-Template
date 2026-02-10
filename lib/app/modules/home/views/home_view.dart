import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Column(
        children: [
          BigAppText(
            'HomeView',
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          const Center(
            child: Text('HomeView', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
