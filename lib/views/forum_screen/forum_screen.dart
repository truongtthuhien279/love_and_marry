import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/forum_screen/components/forum.dart';

import '../../consts/colors.dart';
import '../../consts/lists.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  bool isFavorite = false;
  bool isdislike = false;
  bool isTapped = false;
  bool isTapped1 = false;
  int favoriteCount = 0;
  int dislikeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Wedding Forums",
            style: TextStyle(color: brownColor),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: brownColor),
              onPressed: () {},
              iconSize: 40,
            ),
            SizedBox(height: 100),
          ],
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      forumDetail(
                          title: "Recent Comments",
                          width: context.screenWidth / 2.5),
                      SizedBox(
                        width: 10,
                      ),
                      forumDetail(
                        width: context.screenWidth / 2.5,
                        title: "Recent Discussion",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      forumDetail(
                          title: "Most View", width: context.screenWidth / 2.5),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: "Groups          "
                          .text
                          .fontFamily(semibold)
                          .fontWeight(FontWeight.bold)
                          .size(25)
                          .color(brownLine)
                          .make(),
                    ).box.margin(EdgeInsets.only(left: 12)).make(),
                    16.widthBox,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: "View all >>"
                          .text
                          .fontFamily(semibold)
                          .fontWeight(FontWeight.bold)
                          .size(13)
                          .color(fontGrey)
                          .make(),
                    )
                        .box
                        .margin(EdgeInsets.only(left: 12))
                        .padding(EdgeInsets.only(left: 70))
                        .make(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Wedding Attire
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Đặt border radius cho hình ảnh
                                  child: Image.asset(imgForm1,
                                      width: 150, height: 121, fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                // Điều này đặt nó ở phía dưới hình ảnh
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black87, // Màu nền đen tối
                                        Colors.transparent, // Màu trong suốt
                                      ],
                                      //color: Colors.grey.withOpacity(0.1),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ), // Màu nền đen, bạn có thể điều chỉnh độ mờ
                                  child: Text(
                                    "Wedding Attire",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              .box
                              .roundedLg
                              .margin(EdgeInsets.only(bottom: 10, left: 12))
                              .shadowSm
                              .white
                              .make(),
                          15.widthBox,

                          // Honeymoons & Getting Married
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Đặt border radius cho hình ảnh
                                  child: Image.asset(imgForm3,
                                      width: 150, height: 121, fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                // Điều này đặt nó ở phía dưới hình ảnh
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black87, // Màu nền đen tối
                                        Colors.transparent, // Màu trong suốt
                                      ],
                                      //color: Colors.grey.withOpacity(0.1),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ), // Màu nền đen, bạn có thể điều chỉnh độ mờ
                                  child: Text(
                                    "Honeymoons & Getting Married",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              .box
                              .roundedLg
                              .margin(EdgeInsets.only(bottom: 10, left: 12))
                              .shadowSm
                              .white
                              .make(),
                          15.widthBox,

                          //Feedback to L&M
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Đặt border radius cho hình ảnh
                                  child: Image.asset(imgForm2,
                                      width: 150, height: 121, fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                // Điều này đặt nó ở phía dưới hình ảnh
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black87, // Màu nền đen tối
                                        Colors.transparent, // Màu trong suốt
                                      ],
                                      //color: Colors.grey.withOpacity(0.1),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ), // Màu nền đen, bạn có thể điều chỉnh độ mờ
                                  child: Text(
                                    "Feedback to L&M",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              .box
                              .roundedLg
                              .margin(EdgeInsets.only(bottom: 10, left: 12))
                              .shadowSm
                              .white
                              .make(),
                          15.widthBox,
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: "LATTEST DISCUSSIONS"
                          .text
                          .fontFamily(semibold)
                          .fontWeight(FontWeight.bold)
                          .size(20)
                          .color(textfieldGrey)
                          .make(),
                    ).box.margin(EdgeInsets.only(left: 12)).make(),
                    50.widthBox,
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(imgAvata2, width: 60, fit: BoxFit.cover)
                        .box
                        .margin(EdgeInsets.only(left: 12))
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "James"
                                .text
                                .size(18)
                                .fontFamily(semibold)
                                .color(brownColor)
                                .make(),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
                                          isTapped = true;
                                          if (isFavorite) {
                                            favoriteCount++;
                                          } else {
                                            favoriteCount = favoriteCount > 0
                                                ? favoriteCount - 1
                                                : 0;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite_sharp
                                            : Icons.favorite_outline,
                                        color:
                                        isTapped ? Colors.red : textfieldGrey,
                                        size: 35,
                                      ),
                                    ),
                                    if (favoriteCount > 0)
                                      Positioned(
                                        top: -4,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: greyColor,
                                            // Màu nền của số lượt xem
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            favoriteCount.toString(),
                                            // Số lượt yêu thích
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                // Khoảng trống giữa hai icon
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Xử lý sự kiện khi nhấp vào biểu tượng xem
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: textfieldGrey,
                                        // Màu của biểu tượng xem
                                        size: 35,
                                      ),
                                    ),
                                    Positioned(
                                      top: -3,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: greyColor,
                                          // Màu nền của số lượt xem
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          "20",
                                          // Thay thế bằng số lượt xem thực tế
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                //Icon dislike
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isdislike = !isdislike;
                                          isTapped1 = true;
                                          if (isdislike) {
                                            dislikeCount++;
                                          } else {
                                            dislikeCount = dislikeCount > 0
                                                ? dislikeCount - 1
                                                : 0;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.thumb_down_sharp,
                                        color: textfieldGrey,
                                        // Màu của biểu tượng dislike
                                        size: 35,
                                      ),
                                    ),
                                    // Hiển thị số lượt dislike khi có
                                    if (dislikeCount > 0)
                                      Positioned(
                                        top: -4,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: greyColor,
                                            // Màu nền của số lượt dislike
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            dislikeCount.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),


                              ],
                            ),
                            SingleChildScrollView(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: "sunday 7-nov-23"
                                    .text
                                    .fontFamily(semibold)
                                    .fontWeight(FontWeight.bold)
                                    .size(13)
                                    .color(fontGrey)
                                    .make(),
                              )
                                  .box
                                  .margin(EdgeInsets.only(left: 12))
                                  .padding(EdgeInsets.only(left: 7))
                                  .make(),
                            ),


                          ]
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: "Feeling let down by friends"
                            .text
                            .fontFamily(semibold)
                            //.fontWeight(FontWeight.bold)
                            .size(22)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                    ),
                    50.widthBox,
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            "Hello all,Hope you are all well.First time posting! Bit of a longer read. Sorry I got engaged on the 11th of august 2023,was over..."
                                .text
                                .fontFamily(regular)
                                .fontWeight(FontWeight.bold)
                                .size(15)
                                .color(brownLine)
                                .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                    ),
                    10.widthBox,
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(imgAvata2, width: 60, fit: BoxFit.cover)
                        .box
                        .margin(EdgeInsets.only(left: 12))
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Jessica"
                                .text
                                .size(18)
                                .fontFamily(semibold)
                                .color(brownColor)
                                .make(),
                            SizedBox(
                              height: 2,
                            ),

                            //         Stack(
                            //           alignment: Alignment.topRight,
                            //           children: [
                            //             GestureDetector(
                            //               onTap: () {
                            //                 setState(() {
                            //                   isFavorite = !isFavorite;
                            //                   isTapped = true;
                            //                   if (isFavorite) {
                            //                     favoriteCount++;
                            //                   } else {
                            //                     favoriteCount = favoriteCount > 0 ? favoriteCount - 1 : 0;
                            //                   }
                            //                 });
                            //               },
                            //               child: Icon(
                            //                     isFavorite
                            //                         ? Icons.favorite_sharp
                            //                         :Icons.favorite_outline,
                            //                     color: isTapped ? Colors.red : textfieldGrey,
                            //                     size: 35,
                            //                   ),
                            // ),
                            //                   if (favoriteCount > 0)
                            //                     Positioned(
                            //                       top: 0,
                            //                       right: 0,
                            //                       child: CircleAvatar(
                            //                         backgroundColor: greyColor,
                            //                         radius: 7,
                            //                         child: Text(
                            //                           favoriteCount.toString(),
                            //                           style: TextStyle(
                            //                             color: Colors.black, fontFamily: bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ),
                            //
                            //
                            //           ],
                            //
                            //         ),
                            //         SizedBox(width: 10,),
                            //         Positioned(
                            //           top:0,
                            //           left:20,
                            //           child: Stack(
                            //             alignment: Alignment.center,
                            //             children: [
                            //               GestureDetector(
                            //                 onTap: () {},
                            //                 child: Icon(
                            //                   Icons.remove_red_eye,
                            //                   color: textfieldGrey,
                            //                   size: 35,
                            //                 ),
                            //               ),
                            //               SizedBox(width: 5,),
                            //               Positioned(
                            //                   top: 0,
                            //                   right: 0,
                            //                   child: Container(
                            //                     padding: EdgeInsets.all(4),
                            //                     decoration: BoxDecoration(
                            //                       color: Colors.red, // Màu nền của số lượt xem
                            //                       shape: BoxShape.circle,
                            //                     ),
                            //                     child: Text(
                            //                       "711",
                            //                       style: TextStyle(
                            //                         color: Colors.white,
                            //                         fontSize: 12,
                            //                       ),
                            //                     ),
                            //               ),
                            //               ),
                            //             ],
                            //         ),
                            //         ),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
                                          isTapped = true;
                                          if (isFavorite) {
                                            favoriteCount++;
                                          } else {
                                            favoriteCount = favoriteCount > 0
                                                ? favoriteCount - 1
                                                : 0;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite_sharp
                                            : Icons.favorite_outline,
                                        color:
                                            isTapped ? Colors.red : textfieldGrey,
                                        size: 35,
                                      ),
                                    ),
                                    if (favoriteCount > 0)
                                      Positioned(
                                        top: -4,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: greyColor,
                                            // Màu nền của số lượt xem
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            favoriteCount.toString(),
                                            // Số lượt yêu thích
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                // Khoảng trống giữa hai icon
                                SingleChildScrollView(
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Xử lý sự kiện khi nhấp vào biểu tượng xem
                                        },
                                        child: Icon(
                                          Icons.remove_red_eye,
                                          color: textfieldGrey,
                                          // Màu của biểu tượng xem
                                          size: 35,
                                        ),
                                      ),
                                      Positioned(
                                        top: -3,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: greyColor,
                                            // Màu nền của số lượt xem
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            "10",
                                            // Thay thế bằng số lượt xem thực tế
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                //Icon dislike
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isdislike = !isdislike;
                                          isTapped1 = true;
                                          if (isdislike) {
                                            dislikeCount++;
                                          } else {
                                            dislikeCount = dislikeCount > 0
                                                ? dislikeCount - 1
                                                : 0;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.thumb_down_sharp,
                                        color: textfieldGrey,
                                        // Màu của biểu tượng dislike
                                        size: 35,
                                      ),
                                    ),
                                    // Hiển thị số lượt dislike khi có
                                    if (dislikeCount > 0)
                                      Positioned(
                                        top: -4,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: greyColor,
                                            // Màu nền của số lượt dislike
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            dislikeCount.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),

                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: "thursday 20-sep-23"
                                  .text
                                  .fontFamily(semibold)
                                  .fontWeight(FontWeight.bold)
                                  .size(13)
                                  .color(fontGrey)
                                  .make(),
                            )
                                .box
                                .margin(EdgeInsets.only(left: 12))
                                .padding(EdgeInsets.only(left: 7))
                                .make(),


                          ]
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: "Wedding with no breakfast?"
                            .text
                            .fontFamily(semibold)
                            //.fontWeight(FontWeight.bold)
                            .size(22)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                    ),
                    50.widthBox,
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                        "Hello! Newly engaged so this is my first post here basically, me and hubby to be have bên together a long time and we cannot"
                            .text
                            .fontFamily(regular)
                            .fontWeight(FontWeight.bold)
                            .size(15)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                    ),
                    10.widthBox,
                  ],
                ),


              ]),
            ),
          ),
        ),
      ),
    );
  }
}
