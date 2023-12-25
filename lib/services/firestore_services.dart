
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/firebase_consts.dart';

class CostData {
  final dynamic estimateCost;
  final dynamic finalCost;
  CostData({required this.estimateCost, required this.finalCost});
}
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
  static getCategory(){
    return firestore.collection(serviceCollection).snapshots();
  }
  static getPopularPhotoMake(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Photographers','Make-up']).snapshots();

  }  static getPopularClothing(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Dress', 'Suits']).limit(3).snapshots();

  }
  static getDress(){
    return firestore.collection(productsCollection).where('p_service',  whereIn: ['Dress', 'Suits']).snapshots();
  }
  static getBudget(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return firestore.collection(budgetCollection).where('user_id', isEqualTo: user.uid).snapshots();
    } else{
      return [];
    }
  }

  static Future<CostData> calculateFinalCost() async {
    Stream<QuerySnapshot> budgetStream = getBudget();
    var estimateCost;
    var finalCost = 0;
    // Lắng nghe sự thay đổi trong dữ liệu budget
    await for (QuerySnapshot budgetSnapshot in budgetStream) {
      // Duyệt qua các documents trong snapshot
      for (QueryDocumentSnapshot budgetDoc in budgetSnapshot.docs) {
        // Lấy dữ liệu từ document
        Map<String, dynamic> data = budgetDoc.data() as Map<String, dynamic>;
        // Lấy danh sách product_id từ budget
        List<String> productIds = List<String>.from(data['product_id'] ?? []);
        estimateCost = data['estimated_cost'];
        finalCost = data['final_cost'];
        print("final cost");
        print(finalCost);
        // Duyệt qua danh sách product_id và lấy thông tin sản phẩm
        for (String productId in productIds) {
          QuerySnapshot productSnapshot = await getProductById(productId).get();
          QueryDocumentSnapshot productDoc = productSnapshot.docs.first;
          Map<String, dynamic> productData = productDoc.data() as Map<String, dynamic>;
          int productPrice = productData['s_price'];
          finalCost -= productPrice;
        }
      }
    }
    // Trả về đối tượng của lớp CostData
    return CostData(estimateCost: estimateCost, finalCost: finalCost);
  }
  static getProductById(id){
    return firestore.collection(productsCollection).where('product_id', isEqualTo: id ).snapshots();
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
  static editEstimateCost(int cost) async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection(budgetCollection)
          .where('user_id', isEqualTo: user.uid)
          .get();
      Map<String, dynamic> userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
      int amountSpent = userData['amount_spent'];
      int finalCost = userData['final_cost'];
      String documentId = userSnapshot.docs.first.id;
      int newFinalCost = cost - amountSpent;
      await FirebaseFirestore.instance
          .collection(budgetCollection)
          .doc(documentId)
          .update({'estimate_cost': cost,'final_cost': newFinalCost});
    } else{
      return [];
    }
  }
  static deleteBudget(String id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection(budgetCollection)
          .where('user_id', isEqualTo: user.uid)
          .get();
      Map<String, dynamic> userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
      List<String> productIds = List<String>.from(userData['product_id'] ?? []);
      // Xóa phần tử có id nhất định
      productIds.removeWhere((productId) => productId == id.toString());

      // Cập nhật lại dữ liệu trong Firestore
      await FirebaseFirestore.instance
          .collection(budgetCollection)
          .doc(userSnapshot.docs.first.id)
          .update({'product_id': productIds});
    }
  }
}