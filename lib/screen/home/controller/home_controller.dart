import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/model/db_model.dart';

import '../../../utils/helper/db_helper.dart';
import '../../../utils/helper/json_helper.dart';
import '../../../utils/helper/share_helper.dart';
import '../model/category_model.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> list = <HomeModel>[].obs;
  RxList<categoryModel> l1 = <categoryModel>[].obs;
  RxList<dbModel> favouriteList = <dbModel>[].obs;
  Rx<Color> onColor = Colors.black.obs;
  RxBool isOn = false.obs;
  RxBool FontOn = false.obs;
  RxBool imgOn = false.obs;
  RxBool color = false.obs;
  RxBool isLight = false.obs;
  RxString onFont = "DancingScript".obs;
  RxList fontList = [
    "DancingScript",
    "IndieFlower",
    "Nerko",
    "NewRegular",
    "Roboto-black"
  ].obs;
  RxString onImg = "assets/image/quotes_bg2.png".obs;
  RxList imgList = [
    "assets/image/quotes_bg1.jpg",
    "assets/image/quotes_bg2.png",
    "assets/image/quotes_bg3.jpg",
    "assets/image/quotes_bg4.webp",
    "assets/image/quotes_bg5.jpg",
    "assets/image/quotes_bg6.jpg"
  ].obs;

  void copy(String quotes) {
    Clipboard.setData(ClipboardData(text: quotes));
  }

  Future<void> quotesGetData() async {
    List<HomeModel>? l1 = await JsonHelper.helper.getData();
    list.value = l1!;
  }

  Future<void> quotesCategory() async {
    List<categoryModel>? c1 = await DBHelper.helper.readCategory();
    l1.value = c1!;
  }

  Future<void> likeData() async {
    List<dbModel>? l1 = await DBHelper.helper.readQuery();
    favouriteList.value = l1!;
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper.shareHelper;
    bool? isTheme = await shr.getTheme();
    isLight.value = isTheme ?? false;
  }
}