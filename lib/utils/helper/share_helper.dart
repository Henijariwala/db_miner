import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper{

  Future<void> setNameList(List<String> name) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('name', name);
  }
  Future<void> setQuotesList(List<String> quotes) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('quotes', quotes);
  }

  Future<List<String>> getNameList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String>name= shr.getStringList("name")??[];
    return name;
  }
  Future<List<String>> getQuotesList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String>quotes= shr.getStringList("quotes")??[];
    return quotes;
  }
}