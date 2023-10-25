import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/dress_screen/suits_screen.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/list.dart';
import '../../consts/strings.dart';

class DressScreen extends StatefulWidget {
  const DressScreen({super.key});

  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wedding Dresses", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  10.heightBox,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 330,
                      height: 35,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: darkFontGrey),
                        color: whiteColor,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Image(image: AssetImage(icSearch)),
                            filled: true,
                            hintText: searchItems,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  30.heightBox,
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: "Popular Clothes"
                            .text
                            .fontFamily(bold)
                            .fontWeight(FontWeight.bold)
                            .size(18)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                      50.widthBox,
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: "View all"
                            .text
                            .fontFamily(semibold)
                            .fontWeight(FontWeight.bold)
                            .size(13)
                            .color(fontGrey)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).padding(EdgeInsets.only(left: 70)).make(),
                    ],
                  ),
                  20.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                            onTap: () {
                              // Get.to(() => SuitScreen(title: listDress[index]));
                              setState(() {
                                int indexOnTap = index;
                                for (int i = 0;
                                i < checkOnTap.length;
                                i++) {
                                  checkOnTap[i] = false;
                                }
                                checkOnTap[indexOnTap] = true;
                              });
                            },
                            child: checkOnTap[index] == false
                                ? listDress[index]
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .makeCentered()
                                .box
                                .white
                                .rounded
                                .shadowSm
                                .size(100, 50)
                                .margin(const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8))
                                .make()
                                : listDress[index]
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .color(Colors.white)
                                .makeCentered()
                                .box
                                .color(brownLine)
                                .rounded
                                .shadowSm
                                .size(100, 50)
                                .margin(const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8))
                                .make()
                        );
                      })).box.make().onTap(() {
                        // Get.to(() => SuitScreen(title: listDress[index]));
                  }),

                  30.heightBox,
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    // Đặt border radius cho hình ảnh
                                    child: Image.asset(imgDress1,
                                        width: 162,
                                        height: 252,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: greyishColor, // Màu nền xám
                                    borderRadius: BorderRadius.circular(
                                        100), // Đặt border radius
                                  ),
                                  child: Icon(Icons.favorite_outline,
                                      size: 25, color: Colors.white)
                                      .box
                                      .padding(EdgeInsets.all(10.0))
                                      .alignment(Alignment
                                      .topRight) // Đặt căn lề bên phải
                                      .make(),
                                ).marginOnly(left: 110, top: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: greyishColor,
                                    borderRadius:
                                    BorderRadius.circular(10), // Màu nền xám
                                    // Đặt border radius
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      "Clara, Wedding"
                                          .text
                                          .color(Colors.white)
                                          .size(15)
                                          .fontFamily(semibold)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                      5.heightBox,
                                      Row(
                                        children: [
                                          "Price: "
                                              .text
                                              .color(Colors.grey[300])
                                              .size(12)
                                              .fontFamily(semibold)
                                              .make(),
                                          Icon(Icons.attach_money,
                                              color: Colors.grey[800],
                                              size: 15.0),
                                          "230"
                                              .text
                                              .color(Colors.grey[300])
                                              .size(10)
                                              .fontFamily(semibold)
                                              .make(),
                                          28.widthBox,
                                          Icon(Icons.star_border_outlined,
                                              color: Colors.grey[300],
                                              size: 15.0),
                                          "4.8"
                                              .text
                                              .color(Colors.grey[300])
                                              .size(10)
                                              .fontFamily(semibold)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  )
                                      .box
                                      .margin(EdgeInsets.only(left: 8, top: 3))
                                      .rounded
                                      .width(135)
                                      .height(52)
                                      .make(),
                                )
                                    .box
                                    .margin(EdgeInsets.only(left: 10, top: 184))
                                    .make(),
                              ],
                            )
                                .box
                                .roundedLg
                                .margin(EdgeInsets.only(bottom: 10, left: 12))
                                .shadowSm
                                .white
                                .make(),
                            15.widthBox,

                            // Popular clothes
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    // Đặt border radius cho hình ảnh
                                    child: Image.asset(imgDress2,
                                        width: 162,
                                        height: 252,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: greyishColor, // Màu nền xám
                                    borderRadius: BorderRadius.circular(
                                        100), // Đặt border radius
                                  ),
                                  child: Icon(Icons.favorite_outline,
                                      size: 25, color: Colors.white)
                                      .box
                                      .padding(EdgeInsets.all(10.0))
                                      .alignment(Alignment
                                      .topRight) // Đặt căn lề bên phải
                                      .make(),
                                ).marginOnly(left: 110, top: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: greyishColor,
                                    borderRadius:
                                    BorderRadius.circular(10), // Màu nền xám
                                    // Đặt border radius
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      "Clara, Wedding"
                                          .text
                                          .color(Colors.white)
                                          .center
                                          .size(15)
                                          .fontFamily(semibold)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                      5.heightBox,
                                      Row(
                                        children: [
                                          "Price: "
                                              .text
                                              .color(Colors.grey[300])
                                              .size(12)
                                              .fontFamily(semibold)
                                              .make(),
                                          Icon(Icons.attach_money,
                                              color: Colors.grey[800],
                                              size: 15.0),
                                          "230"
                                              .text
                                              .color(Colors.grey[300])
                                              .size(10)
                                              .fontFamily(semibold)
                                              .make(),
                                          28.widthBox,
                                          Icon(Icons.star_border_outlined,
                                              color: Colors.grey[300],
                                              size: 15.0),
                                          "4.8"
                                              .text
                                              .color(Colors.grey[300])
                                              .size(10)
                                              .fontFamily(semibold)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  )
                                      .box
                                      .margin(EdgeInsets.only(left: 8, top: 3))
                                      .rounded
                                      .width(135)
                                      .height(52)
                                      .make(),
                                )
                                    .box
                                    .margin(EdgeInsets.only(left: 10, top: 184))
                                    .make(),
                              ],
                            )
                                .box
                                .roundedLg
                                .margin(EdgeInsets.only(bottom: 10, left: 12))
                                .shadowSm
                                .white
                                .make(),
                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),

        ),
      ),


    );
  }
}