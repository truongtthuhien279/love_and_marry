import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    String? userid = currentUser?.uid.toString();
    // Lấy reference đến bảng favorites cho người dùng hiện tại
    if (currentUser != null) {
      DocumentReference userFavoritesRef =  firestore.collection(favoriteCollection).doc(userid);
      // Lấy dữ liệu hiện tại trong bảng favorites của người dùng
      DocumentSnapshot userFavoritesSnapshot = await userFavoritesRef.get();

      if (userFavoritesSnapshot.exists) {
        // Nếu bảng favorites của người dùng đã tồn tại, thêm sản phẩm vào danh sách yêu thích
        List<dynamic> productIds = userFavoritesSnapshot['product_id'];
        List<String> ListProductIds = List<String>.from(productIds);
        //nếu sản phẩm đã được yêu thích rồi thì remove yêu thích (yêu thích 2 lần)
        if(productIds.contains(docId)){
          await userFavoritesRef.update({
            'product_id': FieldValue.arrayRemove([docId]),
          });
          // Thông báo cho người dùng rằng sản phẩm đã được xóa khỏi danh sách yêu thích
          VxToast.show(context, msg: 'Đã xóa khỏi yêu thích');
        } else {
          ListProductIds.add(docId);
          await userFavoritesRef.set({
            'product_id': FieldValue.arrayUnion(ListProductIds),
            'user_id': currentUser?.uid.toString(),
          });

          // Thông báo cho người dùng rằng sản phẩm đã được thêm vào danh sách yêu thích
          VxToast.show(context, msg: 'Đã thêm vào danh sách yêu thích');
        }
      } else {
        // Nếu bảng favorites của người dùng chưa tồn tại, tạo mới và thêm sản phẩm vào danh sách yêu thích
        await userFavoritesRef.set({
          'user_id': [currentUser?.uid.toString()],
          'product_id': [docId],
        });
      }
    } else {
      VxToast.show(context, msg: 'Bạn cần đăng nhập');
    }
  }

  removeFromWishList(docId,context) async {
    await firestore.collection(productsCollection)
        .doc(docId)
        .update({'p_favlist': 1});
    isFav(false);
    VxToast.show(context, msg: "Removed from wishlist");
  }
  Future<bool> checkIfFav(String productId) async {
    DocumentReference userFavoritesRef =
    await firestore.collection(favoriteCollection).doc(currentUser?.uid.toString());
    DocumentSnapshot userFavoritesSnapshot = await userFavoritesRef.get();
    List<dynamic> productIds = userFavoritesSnapshot['product_id'];
    return productIds.contains(productId);
  }
}