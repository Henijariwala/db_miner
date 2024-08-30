import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/controller/home_controller.dart';
import 'package:quotes_app/utils/app_routes.dart';

void main() {
  HomeController controller = Get.put(HomeController());
  controller.changeTheme();
  runApp(
    Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
      theme: controller.isLight.value?ThemeData.light():ThemeData.dark(),
    ),
    ),
  );
}
