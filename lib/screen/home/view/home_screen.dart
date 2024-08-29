import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.quotesGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Get.toNamed('favorite');
                  },
                  child: const Text("Favorite"),
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/image/home_bg.webp",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('detail',
                              arguments: controller.list[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 100,
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, strokeAlign: 0.5),
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [Colors.white12, Colors.black12])),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    WavyAnimatedText(
                                      '${controller.list[index].name}',
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  totalRepeatCount: 5,
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                ),
                              ),
                            ],
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
//GlassmorphicContainer(
//                     width: MediaQuery.sizeOf(context).width,
//                     height: 100,
//                     borderRadius: 20,
//                     blur: 20,
//                     alignment: Alignment.bottomCenter,
//                     border: 2,
//                     linearGradient: const LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Colors.black12,
//                           Colors.white12,
//                         ],
//                         stops: [
//                           0.1,
//                           1,
//                         ]),
//                     borderGradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         const Color(0xFFffffff).withOpacity(0.5),
//                         const Color((0xFFFFFFFF)).withOpacity(0.5),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(child: Text("Hello",style: TextStyle(fontSize: 20),)),
//                       ],
//                     ),
//                   ),
