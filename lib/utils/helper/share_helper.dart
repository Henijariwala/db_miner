import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper{

  static ShareHelper shareHelper = ShareHelper._();
  ShareHelper._();

  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("theme");
  }
}