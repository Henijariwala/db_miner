import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../screen/home/model/home_model.dart';

class ApiHelper{
  static ApiHelper helper = ApiHelper._();
  ApiHelper._();
  // Future<HomeModel?> quotesApi() async {
  //   String apiLink ="https://viditsavaliya19.github.io/JSON/quotes.json";
  //
  //   var response = await http.get(Uri.parse(apiLink));
  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     HomeModel homeModel = HomeModel.mapToModel(json);
  //     return homeModel;
  //   }
  //   return null;
  // }

}