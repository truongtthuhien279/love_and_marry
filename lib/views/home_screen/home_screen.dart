import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/colors.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(image: AssetImage(imgH1), fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 303,
                      height: 31,
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
                            hintText: searchResort,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  )
                ],
              ),
              10.heightBox,
              Container(
                  margin: EdgeInsets.only(right: 12, left: 12),
                  child: Column(
                    children: [
                      //toprate
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                  onTap: () {
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
                                      ? listTopRate[index]
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
                                              horizontal: 4, vertical: 4))
                                          .make()
                                      : listTopRate[index]
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
                                              horizontal: 4, vertical: 4))
                                          .make()
                                  // listTopRate[index]
                                  //     .text
                                  //     .size(12)
                                  //     .fontFamily(semibold)
                                  //     .color(Colors.white)
                                  //     .makeCentered()
                                  //     .box
                                  //     .color(brownLine)
                                  //     .shadowSm
                                  //     .rounded
                                  //     .size(100, 50)
                                  //     .margin(const EdgeInsets.symmetric(horizontal: 4))
                                  //     .make()
                                  );
                            })),
                      ),

                      //list top rate
                      10.heightBox,
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          4,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                  child: Image.asset(listImgResort[index],
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              10.heightBox,
                              Container(
                                margin: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    listTitleTopRate[index]
                                        .text
                                        .size(16)
                                        .fontWeight(FontWeight.bold)
                                        .make(),
                                    10.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 15.0),
                                        8.widthBox,
                                        "4.93".text.size(13).make(),
                                        8.widthBox,
                                        "(111 reviews)".text.size(9).make(),
                                        25.widthBox,
                                        favoriteCheck[index] == true
                                            ? Icon(
                                                Icons.favorite_sharp,
                                                size: 20,
                                                color: Colors.red,
                                              ).onTap(() {
                                                print(favoriteCheck[index]);
                                                setState(() {
                                                  favoriteCheck[index] =
                                                      !favoriteCheck[index];
                                                });
                                              })
                                            : Icon(
                                                Icons.favorite_outline,
                                                size: 20,
                                              ).onTap(() {
                                                setState(() {
                                                  favoriteCheck[index] =
                                                      !favoriteCheck[index];
                                                });
                                              })
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                              .box
                              .roundedLg
                              .shadowSm
                              .white
                              .margin(EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8))
                              .make()
                              .onTap(() {}),
                        )),
                      ),

                      //photo + makup
                      10.heightBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: "Popular Services"
                            .text
                            .fontFamily(bold)
                            .fontWeight(FontWeight.bold)
                            .size(22)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                      10.heightBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8, bottom: 10),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(
                                  10.0), // Đặt border radius ở đây
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // Đặt border radius cho hình ảnh
                                    child: Image.asset(imgPT,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                10.widthBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Photographers"
                                        .text
                                        .size(11)
                                        .fontWeight(FontWeight.bold)
                                        .make(),
                                    10.heightBox,
                                    Row(
                                      children: [
                                        "ShortListed"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                        10.widthBox,
                                        "|"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                        10.widthBox,
                                        "Booked : 1"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, bottom: 10),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(
                                  10.0), // Đặt border radius ở đây
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // Đặt border radius cho hình ảnh
                                    child: Image.asset(imgMake,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                10.widthBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Make-up"
                                        .text
                                        .size(11)
                                        .fontWeight(FontWeight.bold)
                                        .make(),
                                    10.heightBox,
                                    Row(
                                      children: [
                                        "ShortListed"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                        10.widthBox,
                                        "|"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                        10.widthBox,
                                        "Booked : 1"
                                            .text
                                            .size(10)
                                            .fontWeight(FontWeight.normal)
                                            .make(),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      //text popular clothes
                      10.heightBox,
                      Align(
                        alignment: Alignment.topLeft,
                        child: "Popular Clothes"
                            .text
                            .fontFamily(bold)
                            .fontWeight(FontWeight.bold)
                            .size(22)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),

                      //pppular dress
                      10.heightBox,
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                    child: Image.asset(imgSuit1,
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
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
