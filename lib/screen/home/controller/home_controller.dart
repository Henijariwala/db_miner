import 'package:get/get.dart';
import 'package:quotes_app/screen/home/model/db_model.dart';
import 'package:quotes_app/utils/helper/api_helper.dart';

import '../../../utils/helper/db_helper.dart';
import '../../../utils/helper/json_helper.dart';
import '../model/category_model.dart';
import '../model/home_model.dart';

class HomeController extends GetxController{
  // RxList<HomeModel>modelList=<HomeModel>[].obs;
  // Future<void> getData() async
  // {
  //   List<HomeModel> l1 = (await ApiHelper.helper.quotesApi()) as List<HomeModel>;
  //   modelList.value = l1;
  // }

  RxList<HomeModel>list=<HomeModel>[].obs;
  RxList<categoryModel>l1=<categoryModel>[].obs;
  RxList<dbModel> favouriteList = <dbModel>[].obs;

  Future<void> quotesGetData()
  async {
    List<HomeModel>? l1 = await JsonHelper.helper.getData();
    list.value = l1!;
  }
  Future<void> quotesCategory() async {
    List<categoryModel>? c1= await DBHelper.helper.readCategory();
    l1.value = c1!;
  }

  Future<void> likeData()
  async {
    List<dbModel>? l2= (await DBHelper.helper.readQuery())?.cast<dbModel>();
    favouriteList.value=l2!;
  }
}