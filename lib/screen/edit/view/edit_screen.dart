import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/helper/db_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/model/db_model.dart';

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

  GlobalKey repaintKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("edit"),
        actions: [
          IconButton(
              onPressed: () {
                dbModel model = dbModel(
                  quotes: l1[1],
                  author: l1[0],
                  name: l1[3],
                );
                DBHelper.helper.insertQuery(model);
                controller.likeData();
                Get.snackbar("Favorite quotes", "success");
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RepaintBoundary(
              key: repaintKey,
              child: Obx(
                () => Container(
                    height: 450,
                    width: MediaQuery.sizeOf(context).width,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${controller.onImg.value}"),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              "${l1[1]}",
                              style: TextStyle(
                                  color: controller.onColor.value,
                                  fontSize: 20,
                                  fontFamily: controller.onFont.value,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Obx(
                            () => Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "~${l1[0]}",
                                style: TextStyle(
                                    color: controller.onColor.value,
                                    fontSize: 20,
                                    fontFamily: controller.onFont.value,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    controller.isOn.value = !controller.isOn.value;
                  },
                  icon: const Icon(Icons.color_lens)),
              IconButton(
                  onPressed: () {
                    controller.FontOn.value = !controller.FontOn.value;
                  },
                  icon: const Icon(Icons.font_download)),
              IconButton(
                  onPressed: () async {
                    SaveImage();
                  },
                  icon: const Icon(Icons.save)),
              IconButton(
                  onPressed: () async {
                    controller.copy(l1[1]);
                    Get.back();
                    Get.snackbar("copy quotes", "Successfully copy to quotes");
                  },
                  icon: const Icon(Icons.copy)),
              IconButton(
                  onPressed: () {
                    controller.imgOn.value = !controller.imgOn.value;
                  },
                  icon: const Icon(Icons.image)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //color
          Obx(
            () => Visibility(
              visible: controller.isOn.value,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: Colors.accents.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.onColor.value = Colors.accents[index];
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.accents[index],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          //font
          Obx(
            () => Visibility(
              visible: controller.FontOn.value,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: controller.fontList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.onFont.value = controller.fontList[index];
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        width: 40,
                        child: Text("${controller.fontList[index]}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          //image
          Obx(
            () => Visibility(
              visible: controller.imgOn.value,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.imgList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.onImg.value = controller.imgList[index];
                      },
                      child: Container(
                          height: 40,
                          margin: const EdgeInsets.all(10),
                          width: 40,
                          child: Image.asset(controller.imgList[index])),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> SaveImage() async {
    RenderRepaintBoundary boundary =
        repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var bytes = byteData!.buffer.asUint8List();

    String name =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

    if (Platform.isAndroid) {
      await File("/storage/emulated/0/Download/$name.png").writeAsBytes(bytes);
      return "/storage/emulated/0/Download/$name.png";
    } else {
      //IOS
      Directory? dir = await getDownloadsDirectory();

      File("${dir!.path}/.png");
      return "${dir!.path}/.png";
    }
  }
}
//https://static.vecteezy.com/system/resources/previews/027/231/654/non_2x/illustration-graphic-of-aesthetic-background-template-with-simple-and-minimalist-pastel-colors-vector.jpg,
//https://m.media-amazon.com/images/I/61wJHL09dRL.png
//https://wallpapers.com/images/featured/light-blue-aesthetic-iphone-3n1hpntmp37i4wrz.jpg
//https://cdn.pixabay.com/photo/2022/03/29/18/23/pattern-7099923_640.png
//https://static.vecteezy.com/system/resources/thumbnails/007/251/566/small/4k-hd-wallpaper-for-computer-desktop-with-dark-aesthetic-and-dope-trippy-wallpapers-for-cute-girls-photo.jpg
//https://i.pinimg.com/736x/b6/ef/d0/b6efd0f9cc502bc6e3d2aa538baef422.jpg
