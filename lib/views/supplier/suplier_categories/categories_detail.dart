import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/supplier/suplier_categories/item_details.dart';

import '../../../consts/colors.dart';
import '../../../consts/list.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}
class _CategoryDetailsState extends State<CategoryDetails> {
  bool isFavorite = false;

  List<bool> checkOnTap = [false, false, false, false]; // Trạng thái của từng mục


@override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Resorts",
            style: TextStyle(color: brownColor),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.only(right: 7, left: 7),
          child: Column(
            children: [
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
                      );
                    })),
              ),

              SizedBox(height: 20,),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 227, mainAxisSpacing: 7, crossAxisSpacing: 7),
                    itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgRS5,
                          height: 150,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5,),
                        " The Regent".text.fontFamily(semibold).fontWeight(FontWeight.bold).size(15).color(brownColor).make(),
                        // SizedBox(height: 5,),
                        // "   \$6000".text.fontFamily(bold).color(Colors.red).size(16).make(),
                        SizedBox(height: 5),
                        // SingleChildScrollView(
                        //   child: Row(
                        //     mainAxisAlignment:
                        //     MainAxisAlignment.start,
                        //     crossAxisAlignment:
                        //     CrossAxisAlignment.start,
                        //     children: [
                        //
                        //       Icon(Icons.star,
                        //           color: golden, size: 15.0),
                        //       3.widthBox,
                        //       "4.93".text.size(7).make(),
                        //       3.widthBox,
                        //       "(111 reviews)".text.size(7).make(),
                        //       3.widthBox,
                        //       IconButton( onPressed: () {
                        //         setState(() {
                        //           isFavorite = !isFavorite;
                        //         });
                        //           }, icon: Icon( isFavorite ? Icons.favorite_sharp : Icons.favorite_outline,
                        //             color: isFavorite ? Colors.red : Colors.grey,)),
                        //
                        //
                        //
                        //
                        //     ],
                        //   ),
                        // ),
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: golden, size: 15.0),
                                  3.widthBox,
                                  "4.93".text.size(7).make(),
                                  3.widthBox,
                                  "(111 reviews)".text.size(7).make(),
                                ],
                              ),
                              Expanded(
                                child: Container(), // Đây là widget để mở rộng khoảng trắng
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                icon: Icon(
                                  isFavorite ? Icons.favorite_sharp : Icons.favorite_outline,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).box.white.rounded.roundedLg.margin(EdgeInsets.symmetric(horizontal: 4)).outerShadowSm.clip(Clip.antiAlias).shadowSm.make().onTap(() {
                      Get.to(() => Itemdetails(title: "Resort detail"));
                    });


                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
