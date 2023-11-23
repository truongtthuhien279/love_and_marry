import 'package:love_and_marry_app/consts/firebase_consts.dart';

class FirestoreServices {
  //get User data
  static getUser(uid) {
    return firestore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products arcording to category
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_service', isEqualTo: category).snapshots();

  }
}