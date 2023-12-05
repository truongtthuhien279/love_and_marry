
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/firebase_consts.dart';

class FirestoreServices {
  //get User data
  static getUser(uid) {
    return firestore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products arcording to category
  static getProducts(category) {
    return firestore.collection(productsCollection).where(
        'p_service', isEqualTo: category).snapshots();
  }
  static getToprate() {
    return  firestore.collection(popularSvCollection).snapshots();
    // return firestore.collection(popularSvCollection).where('s_name',isEqualTo: 'dress').snapshots();
  }
  static getPopularProduct(){
      return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Resorts']).snapshots();
  }
  static getPopularPhotoMake(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Photographers','Make-up']).snapshots();

  }  static getPopularClothing(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Dress', 'Suits']).limit(3).snapshots();

  }
  static getDress(){
    return firestore.collection(productsCollection).where('p_service',  whereIn: ['Dress', 'Suits']).snapshots();
  }



  Future<List<Map<String, dynamic>>> getFavorite() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String currentUserUID = user.uid;

      // Lấy reference đến bảng favorites cho người dùng hiện tại
      DocumentReference userFavoritesRef = firestore.collection(favoriteCollection).doc(currentUser?.uid);
      // Lấy dữ liệu từ bảng favorite
      DocumentSnapshot favoriteSnapshot = await userFavoritesRef.get();

      if (favoriteSnapshot.exists) {
        // Lấy danh sách product_id từ bảng favorite
        List<dynamic> productIds = favoriteSnapshot['product_id'];
        // Truy vấn bảng product dựa trên danh sách product_id
        QuerySnapshot productsSnapshot = await firestore.collection(productsCollection)
            .where('product_id', whereIn: productIds)
            .get();

        // Chuyển đổi QuerySnapshot thành danh sách chi tiết sản phẩm
        List<Map<String, dynamic>> productList = [];
        for (var doc in productsSnapshot.docs) {
          productList.add(doc.data() as Map<String, dynamic>);
        }

        return productList;
      } else {
        // Người dùng không đăng nhập
        // VxToast.show(context as BuildContext, msg: 'Bạn phải đăng nhập');
      }
    }
    return []; // Trả về một danh sách trống nếu không có dữ liệu
  }

}