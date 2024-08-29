import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/model/db_model.dart';

import '../../../utils/helper/db_helper.dart';
import '../../../utils/helper/json_helper.dart';
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
  RxString onFont = "DancingScript".obs;
  RxList fontList = [
    "DancingScript",
    "IndieFlower",
    "Nerko",
    "NewRegular",
    "Roboto-black"
  ].obs;
  RxString onImg = "https://m.media-amazon.com/images/I/61wJHL09dRL.png".obs;
  RxList imgList = [
    "https://static.vecteezy.com/system/resources/previews/027/231/654/non_2x/illustration-graphic-of-aesthetic-background-template-with-simple-and-minimalist-pastel-colors-vector.jpg",
    "https://m.media-amazon.com/images/I/61wJHL09dRL.png",
    "https://wallpapers.com/images/featured/light-blue-aesthetic-iphone-3n1hpntmp37i4wrz.jpg",
    "https://cdn.pixabay.com/photo/2022/03/29/18/23/pattern-7099923_640.png",
    "https://static.vecteezy.com/system/resources/thumbnails/007/251/566/small/4k-hd-wallpaper-for-computer-desktop-with-dark-aesthetic-and-dope-trippy-wallpapers-for-cute-girls-photo.jpg",
    "https://i.pinimg.com/736x/b6/ef/d0/b6efd0f9cc502bc6e3d2aa538baef422.jpg"
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
}
