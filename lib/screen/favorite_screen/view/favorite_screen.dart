import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/controller/home_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  HomeController controller = Get.put(HomeController());

  void initState() {
    // TODO: implement initState
    super.initState();
    controller.likeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: controller.favouriteList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${controller.favouriteList[index].quotes }",
                  style: TextStyle(fontSize: 18),
                ),
              );
          },)
        ],
      ),
    );
  }
}
