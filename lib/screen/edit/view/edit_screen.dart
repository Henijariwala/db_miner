import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/helper/db_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/model/category_model.dart';
import '../../home/model/db_model.dart';
import '../../home/model/home_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List l1 = Get.arguments;
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.likeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("edit"),
        actions: [
          IconButton(onPressed: () {
            dbModel model = dbModel(
              quotes: l1[1],
              author: l1[0],
              name: l1[3],
            );
            DBHelper.helper.insertQuery(model);
            controller.likeData();
            Get.snackbar("Favorite quotes", "success");
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 450,
              width: MediaQuery.sizeOf(context).width,
               alignment: Alignment.topCenter,
               decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage("https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm00NTItZi0wMTQuanBn.jpg"),fit: BoxFit.cover
                 )
              ),
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${l1[1]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.text_fields,size: 30,)),
                const SizedBox(width: 10,),
                IconButton(onPressed: () {}, icon: Icon(Icons.text_format,size: 30,)),
                const SizedBox(width: 10,),
                IconButton(onPressed: () {}, icon: Icon(Icons.color_lens,size: 30,)),
                const SizedBox(width: 10,),
                IconButton(onPressed: () {}, icon: Icon(Icons.image,size: 30,)),
                const SizedBox(width: 10,),
                IconButton(onPressed: () {}, icon: Icon(Icons.save,size: 30,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//https://static.vecteezy.com/system/resources/previews/027/231/654/non_2x/illustration-graphic-of-aesthetic-background-template-with-simple-and-minimalist-pastel-colors-vector.jpg,
//https://m.media-amazon.com/images/I/61wJHL09dRL.png
//https://wallpapers.com/images/featured/light-blue-aesthetic-iphone-3n1hpntmp37i4wrz.jpg
//https://cdn.pixabay.com/photo/2022/03/29/18/23/pattern-7099923_640.png
//https://static.vecteezy.com/system/resources/thumbnails/007/251/566/small/4k-hd-wallpaper-for-computer-desktop-with-dark-aesthetic-and-dope-trippy-wallpapers-for-cute-girls-photo.jpg
//https://i.pinimg.com/736x/b6/ef/d0/b6efd0f9cc502bc6e3d2aa538baef422.jpg
