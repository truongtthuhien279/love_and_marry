import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../../consts/colors.dart';
import '../../../consts/lists.dart';
import 'categories_detail.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Suppliers",
            style: TextStyle(color: brownColor),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 3, //số danh mục
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200),
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Image.asset(
                        categoriesImages[index],
                        height: 160,
                        width: 230,
                        fit: BoxFit.cover,),
                      SizedBox(height: 10,),
                      categoriesList[index].text.color(brownColor).fontWeight(FontWeight.bold).align(TextAlign.center).make(),
                    ],
                  ).box.white.rounded.clip(Clip.antiAlias).shadowSm.make().onTap(() {
                    Get.to(() => CategoryDetails(title: categoriesList[index]));
                  });
    }),
      ),
        ),
      ),
    );
  }
}
