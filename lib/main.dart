import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
   GetMaterialApp(
     debugShowCheckedModeBanner: false,
     routes: app_routes,
   )
  );
}
