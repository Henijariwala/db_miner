import 'package:flutter/cupertino.dart';
import 'package:quotes_app/screen/detail/view/detail_screen.dart';
import 'package:quotes_app/screen/edit/view/edit_screen.dart';
import 'package:quotes_app/screen/favorite_screen/view/favorite_screen.dart';
import 'package:quotes_app/screen/home/view/home_screen.dart';
import 'package:quotes_app/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/': (c1) => const SplashScreen(),
  'home': (c1) => const HomeScreen(),
  'detail': (c1) => const DetailScreen(),
  'edit': (c1) => const EditScreen(),
  'favorite': (c1) => const FavoriteScreen(),
};