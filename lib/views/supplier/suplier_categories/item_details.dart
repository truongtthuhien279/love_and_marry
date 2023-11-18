import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../../consts/colors.dart';
class Itemdetails extends StatefulWidget {
  final String? title;
  const Itemdetails({Key? key, required this.title}) : super(key: key);

  @override
  State<Itemdetails> createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return Container(
        color: creamColor,
        width: context.screenWidth,
        height: context.screenHeight,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            //IconButton( onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton( onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            }, icon: Icon( isFavorite ? Icons.favorite_sharp : Icons.favorite_outline,
              color: isFavorite ? Colors.red : Colors.grey,)),
          ],
          title: Text(
            "Resort detail",
            style: TextStyle(color: brownColor),
          ),

          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imgRS3), fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: "The Regent"
                      .text
                      .fontFamily(bold)
                      .fontWeight(FontWeight.bold)
                      .size(30)
                      .color(brownLine)
                      .make(),
                ),

              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: "\$6000"
                          .text
                          .fontFamily(bold)
                          .fontWeight(FontWeight.bold)
                          .size(25)
                          .color(Colors.red)
                          .make(),
                    ).box
                    // .margin(EdgeInsets.only(left: 12))
                        .make(),

                    // Nút "Select Room"
                    TextButton(
                      onPressed: () {
                        // Xử lý khi nhấn nút "Select Room"
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: brownColor, // Màu nền của nút
                        padding: EdgeInsets.all(13), // Kích thước nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Độ bo góc của nút
                        ),
                      ),
                      child: Text(
                        "Select Room",
                        style: TextStyle(color: Colors.white, ), // Màu chữ của nút
                      ),
                    ).box
                    // .margin(EdgeInsets.only(right: 12))
                        .make(),
                  ],
                ),
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: golden,
                            size: 19.0,
                          ),
                        ),
                      ),
                      8.widthBox,
                      "4.93".text.size(13).make(),
                      8.widthBox,
                      "(111 reviews)".text.size(9).make(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // XẾP HẠNG RATING
              // VxRating(
              //   onRatingUpdate: (value) {
              //     // Xử lý khi xếp hạng được cập nhật
              //   }, // value k làm gì cả và onRatingUpdate là 1 hàm callback được gọi khi xếp hạng đc cập nhật
              //   normalColor: textfieldGrey, //màu sắc của ngôi sao khi k đc chọn
              //   selectionColor: golden, // đc chọn
              //   count: 5, // 5 ngôi sao
              //   size: 25,
              //   stepInt: true, // true thì số nguyên , false thì có thể số thập phân chẳng hạn 4.5 sao
              // ),
              //
              // SizedBox(width: 10),
              // Text(
              //   '4.5', // Đặt giá trị xếp hạng ở đây
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgLocation,
                        height: 35,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      "500 Jalan Sultan Road, 199020 Singapore"
                          .text
                          .size(15)
                          .color(darkFontGrey)
                          .make(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Breakfast"
                          .text
                          .size(20)
                          .color(Colors.white)
                          .fontWeight(FontWeight.bold)
                          .make(),
                      SizedBox(width: 32),
                      "Two Bedrooms"
                          .text
                          .size(20)
                          .color(Colors.white)
                          .fontWeight(FontWeight.bold)
                          .make(),
                      SizedBox(width: 32),
                      "Wifi"
                          .text
                          .size(20)
                          .color(Colors.white)
                          .fontWeight(FontWeight.bold)
                          .make(),
                    ],
                  ).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(colorRes).make(),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: "Description"
                      .text
                      .fontFamily(bold)
                      .fontWeight(FontWeight.bold)
                      .size(25)
                      .color(brownLine)
                      .make(),
                ).box
                // .margin(EdgeInsets.only(left: 0))
                    .make(),
              ),
              10.heightBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: "Make yourself at home in one of the 1500 air conditioned rooms featuring LED televisions. Complimentary wireless Internet access keeps you connected."
                      .text
                      .fontFamily(bold)
                  //.fontWeight(FontWeight.bold)
                      .size(18)
                      .color(fontGrey)
                      .make(),
                ).box
                // .margin(EdgeInsets.only(left: 0))
                    .make(),
              ),
              15.heightBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: "Make yourself at home in one of the 1500 air conditioned rooms featuring LED televisions. Complimentary wireless Internet access keeps you connected."
                      .text
                      .fontFamily(bold)
                  //.fontWeight(FontWeight.bold)
                      .size(18)
                      .color(fontGrey)
                      .make(),
                ).box
                // .margin(EdgeInsets.only(left: 0))
                    .make(),
              ),






            ],
          ),
        ),


      ),
    );
  }
}
