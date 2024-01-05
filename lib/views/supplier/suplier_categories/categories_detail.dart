import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/controllers/services_controller.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/dress_screen/products_detail.dart';
import 'package:love_and_marry_app/views/supplier/suplier_categories/item_details.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import 'package:love_and_marry_app/views/widget_common/loading_indicator.dart';

import '../../../consts/colors.dart';
import '../../../consts/list.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

@override
  Widget build(BuildContext context) {
  var controller = Get.find<ServiceController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: title!.text.fontFamily(bold).black.make(),
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getProducts(title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(!snapshot.hasData){
                return  Center(
                  child: loadingIndicator(),
                );
              } else if(snapshot.data!.docs.isEmpty){
                return Center(
                  child: "No products found!".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                return Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                controller.subcat.length,
                                    (index) => "${controller.subcat[index]}"
                                    .text
                                    .size(12)
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .makeCentered()
                                    .box
                                    .white
                                    .rounded.shadowSm
                                    .size(120, 60)
                                    .margin(const EdgeInsets.symmetric(horizontal: 4,vertical: 4))
                                    .make())),
                      ),
                      20.heightBox,
                      Expanded(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisExtent: 227, mainAxisSpacing: 7, crossAxisSpacing: 7),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_imgs'][0],
                                    height: 150,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 4.0,top: 12.0),child: "${data[index]['p_name']}".text.fontFamily(semibold).fontWeight(FontWeight.bold).size(11).color(brownColor).make(),),
                                  SizedBox(height: 5),
                                  Padding(padding: EdgeInsets.only(left: 4.0),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: golden, size: 15.0),
                                            3.widthBox,
                                            "${data[index]['p_rating']}".text.size(7).make(),
                                            3.widthBox,
                                            "(111 reviews)".text.size(7).make(),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(), // Đây là widget để mở rộng khoảng trắng
                                        ),
                                      ],
                                    ),
                                  ),)
                                ],
                              ).box.white.roundedLg.margin(EdgeInsets.symmetric(horizontal: 8,vertical: 8)).outerShadowSm.clip(Clip.antiAlias).shadowSm.make().onTap(() {
                                Get.to(() => ItemDetails(title: "${data[index]['p_name']}",data: data[index]));
                              });
                            }),
                      )
                    ],
                  ),
                );
              }

      }
      ),
      ),
    );
  }
}
