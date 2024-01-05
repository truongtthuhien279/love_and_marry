  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:get/get.dart';

  import '../consts/consts.dart';
  import '../consts/firebase_consts.dart';
  import '../consts/strings.dart';

  class AuthController extends GetxController{
    var isLoading = false.obs;
    //textControllers
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    //login method
    Future<UserCredential?> loginMethod({context}) async{
      UserCredential? userCredential;
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        String errorMessage = "Please enter email and password.";

        VxToast.show(
          context,
          msg: errorMessage,
          position: VxToastPosition.bottom,
        );}
        else{
        try{
          userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        }
        on FirebaseAuthException catch (e) {
          String errorMessage = "Login failed. Wrong email or password.";
          VxToast.show(
            context,
            msg: errorMessage,
            position: VxToastPosition.bottom,);
        }
        return userCredential;
      }

    }

    //signup Method
    Future<UserCredential?> signupMethod({email, password, context}) async{
      UserCredential? userCredential;

      try{
        userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

      }
      on FirebaseAuthException catch (e) {
        VxToast.show(context, msg: e.toString());
      }
      return userCredential;
    }

    //stroring data method
    storeUserData({name, password, email}) async {
      DocumentReference store = await firestore.collection(usersCollection).doc(currentUser!.uid);
      store.set({
        'name':name,
        'password':password,
        'email':email,
        'imageUrl':'',
        'id': currentUser!.uid,
      });
    }

    //signout Method
    signoutMetod(context) async{
      try{
        await auth.signOut();

      }
      catch(e){
        VxToast.show(context, msg: e.toString());

      }
    }

  }