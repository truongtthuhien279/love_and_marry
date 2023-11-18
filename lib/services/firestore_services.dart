import 'package:love_and_marry_app/consts/firebase_consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}