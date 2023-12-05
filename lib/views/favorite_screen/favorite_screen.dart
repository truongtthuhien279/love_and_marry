import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/firebase_consts.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/widget_common/loading_indicator.dart';

import '../../consts/colors.dart';
import '../../controllers/services_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ServiceController>();
    FirestoreServices firestoreServices = new FirestoreServices();
    return Scaffold(
      backgroundColor: creamColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: "My Favorite".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>> (
        future: firestoreServices.getFavorite(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Hiển thị loading khi đang tải dữ liệu
          }
          else if (!snapshot.hasData ) {
             return Center(
              child: loadingIndicator(),
            );
          } else {
            // Hiển thị danh sách sản phẩm
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var productDetail = snapshot.data![index];
                return ListTile(
                  leading: Image.network("${productDetail['p_imgs'][0]}", width: 80,fit: BoxFit.cover,),
                  title: "${productDetail['p_name']}".text.fontFamily(semibold).size(16).make(),
                  subtitle: "${productDetail['p_price']}".numCurrency.text.color(Colors.red).fontFamily(semibold).make(),
                  trailing: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ).onTap(() async {
                    await controller.addToWishList(productDetail['product_id'], context);
                    setState(() {
                    });
                  }),
                  // Thêm các thông tin khác tùy ý
                );
              },
            );
          }
        },
      )

    );
  }
}
