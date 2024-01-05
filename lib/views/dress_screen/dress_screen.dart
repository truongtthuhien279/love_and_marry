import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/controllers/services_controller.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/dress_screen/products_detail.dart';
import 'package:love_and_marry_app/views/dress_screen/suits_screen.dart';
import 'package:love_and_marry_app/views/widget_common/loading_indicator.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/list.dart';
import '../../consts/strings.dart';

class DressScreen extends StatefulWidget {
  final String? title;
  const DressScreen({super.key, this.title});

  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  @override
  Widget build(BuildContext context) {
    var controller =Get.put(ServiceController());
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Wedding Dresses",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.heightBox,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 330,
                      height: 35,
                      margin: EdgeInsets.only(top: 10, left: 12, right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: darkFontGrey),
                        color: whiteColor,
                      ),

                      //Search items
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
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: "View all"
                      //       .text
                      //       .fontFamily(semibold)
                      //       .fontWeight(FontWeight.bold)
                      //       .size(13)
                      //       .color(fontGrey)
                      //       .make(),
                      // ).box.margin(EdgeInsets.only(left: 100)).padding(
                      //     EdgeInsets.only(left: 70)).make(),
                    ],
                  ),
                  20.heightBox,
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(3, (index) {
                          return GestureDetector(
                              onTap: () {
                                // Get.to(() => SuitScreen(title: listDress[index]));
                                setState(() {
                                  int indexOnTap = index;
                                  for (int i = 0; i < checkOnTap.length; i++) {
                                    checkOnTap[i] = false;
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
                                          horizontal: 12, vertical: 8))
                                      .make());
                        })).box.make().onTap(() {
                      // Get.to(() => SuitScreen(title: listDress[index]));
                    }),
                  ),
                  30.heightBox,
                  StreamBuilder(
                      stream: FirestoreServices.getDress(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapShot) {
                        if ((!snapShot.hasData)) {
                          return Center(
                            child: loadingIndicator(),
                          );
                        } else {
                          var alldress = snapShot.data!.docs;
                          return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: alldress.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent: 260),
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              // Đặt border radius cho hình ảnh
                                              child: Image.network(
                                                  alldress[index]['p_imgs'][0],
                                                  width: 160,
                                                  height: 252,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: greyishColor,
                                              // Màu nền xám
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100), // Đặt border radius
                                            ),
                                            child: Icon(Icons.favorite_outline,
                                                    size: 25,
                                                    color: Colors.white)
                                                .box
                                                .padding(EdgeInsets.all(10.0))
                                                .alignment(Alignment
                                                    .topRight) // Đặt căn lề bên phải
                                                .make(),
                                          ).marginOnly(
                                              left: 110, top: 10, bottom: 195),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: greyishColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Màu nền xám
                                              // Đặt border radius
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                "${alldress[index]['p_name']}"
                                                    .text
                                                    .color(Colors.white)
                                                    .size(15)
                                                    .fontFamily(semibold)
                                                    .fontWeight(FontWeight.bold)
                                                    .make(),
                                                Row(
                                                  children: [
                                                    "Price:"
                                                        .text
                                                        .color(Colors.grey[300])
                                                        .size(12)
                                                        .fontFamily(semibold)
                                                        .make(),
                                                    5.widthBox,
                                                    Icon(Icons.attach_money,
                                                        color: Colors.grey[800],
                                                        size: 10.0),
                                                    "${alldress[index]['p_price']}"
                                                        .numCurrency
                                                        .text
                                                        .color(Colors.grey[300])
                                                        .size(10)
                                                        .fontFamily(semibold)
                                                        .make(),
                                                    Icon(Icons.star,
                                                        color: Colors.yellow,
                                                        size: 15.0),
                                                    "${alldress[index]['p_rating']}"
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
                                                .rounded
                                                .width(139)
                                                .height(52)
                                                .make(),
                                          )
                                              .box
                                              .margin(EdgeInsets.only(
                                                  left: 10, top: 184))
                                              .make(),
                                        ],
                                      )
                                          .box
                                          .roundedLg
                                          .margin(EdgeInsets.only(
                                              bottom: 10, left: 12))
                                          .shadowSm
                                          .white
                                          .make().onTap(() {
                                        Get.to(() => ProductsDetail(title: "${alldress[index]['p_name']}",data: alldress[index]));
                                      }),
                                      // Popular clothes
                                    ],
                                  ),
                                );
                              });
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
