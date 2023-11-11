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
class ForumsItem {
  String taskText;
  bool isSelected;

  ForumsItem({required this.taskText, this.isSelected = false});
}
List<ForumsItem> checkItems = List.generate(7, (index) {
  return ForumsItem(taskText: checkButtonsList[index]);
});

class _ForumScreenState extends State<ForumScreen> {
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
              style: TextStyle(
                  color: brownColor
              ),
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
          body: Padding(
              padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    forumDetail(title: "Recent Comments", width: context.screenWidth/ 2.5),
                    SizedBox(width: 10,),
                    forumDetail(width: context.screenWidth/ 2.5, title: "Recent Discussion", ),
                    SizedBox(width: 10,),
                    forumDetail(title: "Most View", width: context.screenWidth/ 2.5),
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
                SizedBox(height: 10,),


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
                SizedBox(height: 10,),
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

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: "Feeling let down by friends"
                            .text
                            .fontFamily(semibold)
                            .fontWeight(FontWeight.bold)
                            .size(22)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 12)).make(),
                    ),
                    50.widthBox,
                    ],
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: "Hello all,Hope you are all well.First time posting! Bit of a longer read. Sorry I got engaged on the 11th of august 2023,was over..."
                            .text
                            .fontFamily(regular)
                            .fontWeight(FontWeight.bold)
                            .size(12)
                            .color(brownLine)
                            .make(),
                      ).box
                          .margin(EdgeInsets.only(left: 12))
                          .make(),
                    ),
                    10.widthBox,
                  ],
                ),



                SizedBox(height: 10,),
            Row(
              children: [
                Image.asset(
                    imgAvata2,
                    width: 60,
                    fit: BoxFit.cover)
                    .box
                    .margin(EdgeInsets.only(left: 12))
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Jessica".text.size(18).fontFamily(semibold).color(
                        brownColor).make(),
                    ]
                ),
            ),









    ],
            ),
            ]
          ),
        ),
    ),

    );
    }

  Widget buildChecklistItem(int taskNumber, String taskText, int index) {
    return Container(
      child: Stack(
                    children: [
                      // Biểu tượng hình tròn ở góc trái
                      Positioned(
                        left: 272.0,
                        top: 10.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // checkItems[index].isSelected =
                              // !checkItems[index].isSelected;
                            });
                            // Xử lý khi người dùng chọn biểu tượng hình tròn
                          },
                          child: Icon(
                            checkItems[index].isSelected
                                ? Icons.favorite_sharp
                                : Icons.favorite_outline,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),

                    ],
                  


      ),
    );
  }
  }
