import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../../consts/colors.dart';
import '../../../controllers/services_controller.dart';
import '../../../services/firestore_services.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({super.key, required this.title, this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    FirestoreServices firestoreServices = new FirestoreServices();
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
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6, // Điều chỉnh tỉ lệ theo nhu cầu
            child: widget.title!.text.color(Colors.black).fontFamily(semibold).make(),
          ),
          actions: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            FutureBuilder<bool>(
              future: controller.checkIfFav(widget.data.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Trạng thái đang chờ, có thể hiển thị một tiện ích đợi hoặc làm gì đó khác.
                  return CircularProgressIndicator();
                // }
                // else if (snapshot.hasError) {
                //   // Xử lý lỗi nếu có
                //   return Text('');
                } else {
                  // Trạng thái đã hoàn thành, sử dụng giá trị snapshot.data để xác định màu sắc của IconButton.
                  bool isFav = snapshot.data ?? false;
                  return Container(
                    child: IconButton(
                      onPressed: () async {
                        await controller.addToWishList(widget.data.id, context);
                        setState(()  {
                        });
                        // Không cần phải chờ ở đây vì đã sử dụng FutureBuilder
                      },
                      icon: Icon(
                        Icons.favorite_outlined,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                  );
                }
              },
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
                            itemCount: widget.data['p_imgs'].length,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index) {
                              return Image.network(
                                widget.data["p_imgs"][index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                        10.heightBox,
                            widget.title!.text
                                .size(16)
                                .color(brownLine)
                                .fontFamily(semibold).fontWeight(FontWeight.bold)
                                .make(),
                            10.heightBox,
                            //Rating
                            VxRating(
                              isSelectable: false,
                              value: double.parse(widget.data["p_rating"]),
                              onRatingUpdate: (value) {},
                              normalColor: textfieldGrey,
                              selectionColor: golden,
                              count: 5,
                              size: 25,
                              maxRating: 5,
                            ),
                            10.heightBox,
                            "${widget.data['p_price']}".numCurrency.text.color(Colors.red).fontFamily(bold).fontWeight(FontWeight.bold).size(18).make(),
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
                                  child: "${widget.data['p_location']}"
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
                                  "${widget.data['p_serviceroom']}"
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
                            child: "${widget.data['p_desc']}"
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
