import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../../consts/colors.dart';
import '../../../controllers/services_controller.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller =Get.find<ServiceController>();
    // var controller = Get.find<ProductController>();
    return Scaffold(
        backgroundColor: creamColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          title: title!.text.color(Colors.black).fontFamily(semibold).make(),
          actions: [
            Obx(()=> IconButton(onPressed: () {
              if(controller.isFav.value){
                controller.removeFromWishList(data.id, context);
              } else {
                controller.addToWishList(data.id,context);
              }
            }, icon: Icon(
              Icons.favorite_outlined,
              color: controller.isFav.value ? Colors.red : darkFontGrey,)

            ),
            ),
          ],
        ),
        body: Column(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        //swiper section
                        VxSwiper.builder(
                            autoPlay: true,
                            height: 320,
                            itemCount: data['p_imgs'].length,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index) {
                              return Image.network(
                                data["p_imgs"][index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                        10.heightBox,
                            title!.text
                                .size(16)
                                .color(brownLine)
                                .fontFamily(semibold).fontWeight(FontWeight.bold)
                                .make(),
                            10.heightBox,
                            //Rating
                            VxRating(
                              isSelectable: false,
                              value: double.parse(data["p_rating"]),
                              onRatingUpdate: (value) {},
                              normalColor: textfieldGrey,
                              selectionColor: golden,
                              count: 5,
                              size: 25,
                              maxRating: 5,
                            ),
                            10.heightBox,
                            "${data['p_price']}".numCurrency.text.color(Colors.red).fontFamily(bold).fontWeight(FontWeight.bold).size(18).make(),
                            10.heightBox,
                      Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgLocation,
                                  height: 35,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: "${data['p_location']}"
                                      .text
                                      .fontFamily(bold)
                                      .size(15)
                                      .color(fontGrey)
                                      .make(),
                                )],),
                          ),
                        ],
                      ),
                            10.heightBox,
                            SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  "${data['p_serviceroom']}"
                                      .text
                                      .size(20)
                                      .color(Colors.white)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                ],
                              ).box.height(50).rounded.shadowSm.padding(EdgeInsets.symmetric(horizontal: 10)).color(colorRes).make(),
                            ),
                            10.heightBox,
                      Column(
                        children: [
                          Container(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: "Description"
                                    .text
                                    .fontFamily(bold)
                                    .fontWeight(FontWeight.bold)
                                    .size(25)
                                    .color(brownLine)
                                    .make(),
                            ),
                          ),
                          10.heightBox,
                          Align(
                            alignment: Alignment.topLeft,
                            child: "${data['p_desc']}"
                                .text
                                .fontFamily(bold)
                                .size(18)
                                .color(fontGrey)
                                .make(),
                          )],
                      ),
                      ]))))
        ]));
  }
}
