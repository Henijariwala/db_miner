import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/controller/home_controller.dart';
import 'package:quotes_app/utils/helper/db_helper.dart';

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
        title: Text("Favorite"),
      ),
      body: Stack(
        children: [
          Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
            child: const Image(image:
            AssetImage("assets/image/fav_src.jpg")
              ,fit: BoxFit.cover,),
      ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(
                    () => Expanded(
                  child: ListView.builder(
                    itemCount: controller.favouriteList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            "${controller.favouriteList[index].quotes}",
                            style: const TextStyle(fontSize: 20,
                                fontFamily: "DancingScript",
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "- ${controller.favouriteList[index].author}",
                            style: const TextStyle(fontSize: 20,
                                fontFamily: "DancingScript",fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              DBHelper.helper.deleteQuery(
                                  controller.favouriteList[index].id!);
                              controller.likeData();
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
