import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/models/suppliers_model.dart';

import '../consts/consts.dart';
import '../consts/firebase_consts.dart';

class ServiceController extends GetxController{

  var subcat =[];
  var quanity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  var isFav = false.obs;
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/suppliers_model.json");
    var decoded = suppliersModelFromJson(data);
    var s = decoded.suppliers.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  resetValue() {
    totalPrice.value = 0;
    quanity.value = 0;
    colorIndex.value = 0;
  }
  addToWishList(docId, context) async {
    try {
      // Lấy thông tin hiện tại của sản phẩm

      print("id in add to wlist----- "+docId);
      final productDoc = await firestore.collection(productsCollection).doc(docId).get();
      if (productDoc.exists) {
        // Lấy giá trị hiện tại của trường p_favlist
        int currentFavValue = productDoc.data()?['p_favlist'] ?? 0;

        // Cập nhật trường p_favlist thành 1 nếu nó là 0, và ngược lại
        int newFavValue = currentFavValue == 0 ? 1 : 0;

        // Thực hiện cập nhật trên Firestore
        await firestore.collection(productsCollection).doc(docId).update({
          'p_favlist': newFavValue,
        });

        // Cập nhật trạng thái isFav nếu cần
        isFav(newFavValue == 1);

        // Hiển thị thông báo
        VxToast.show(context, msg: newFavValue == 1 ? "Added to wishlist" : "Removed from wishlist");
      } else {
        print("Product not found");
      }
    } catch (error) {
      print('Error updating p_favlist: $error');
    }
  }

  removeFromWishList(docId,context) async {
    await firestore.collection(productsCollection)
        .doc(docId)
        .update({'p_favlist': 1});
    isFav(false);
    VxToast.show(context, msg: "Removed from wishlist");
  }

  checkIfFav(data) async {
    if(data['p_favlist'].contains(currentUser!.uid)){
      isFav(true);
    } else {
      isFav(false);
    }
  }
}