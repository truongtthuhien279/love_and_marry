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
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Dress', 'Suits']).snapshots();

  }
  static getDress(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Dress', 'Suits']).snapshots();

  }

  static getFavorite() {
    return firestore.collection(productsCollection).snapshots();
}
}