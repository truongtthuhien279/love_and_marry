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
  addToWishList(docId,context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_favlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Added to wishlist");
  }

  removeFromWishList(docId,context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_favlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
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