import 'package:love_and_marry_app/consts/firebase_consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
  static getToprate() {
    return  firestore.collection(popularSvCollection).snapshots();
    // return firestore.collection(popularSvCollection).where('s_name',isEqualTo: 'dress').snapshots();
  }
  static getPopularProduct(){
      return firestore.collection(popularPrCollection).snapshots();
  }
  static getPopularPhotoMake(){
    return firestore.collection(popularPrCollection).where('p_service',  whereIn: ['Photographers', 'makeup']).snapshots();
  }
}