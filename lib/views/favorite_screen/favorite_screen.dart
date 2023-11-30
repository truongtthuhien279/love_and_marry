import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/firebase_consts.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/widget_common/loading_indicator.dart';

import '../../consts/colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: "My Favorite".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getFavorite(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot ) {
            if(!snapshot.hasData){
              return Center(
                child: loadingIndicator(),
              );
            }    else if(snapshot.data!.docs.isEmpty){
              return "No product yet!".text.color(darkFontGrey).makeCentered();
            } else {
              var fav =snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: fav.length,
                      itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        leading: Image.network("${fav[index]['p_imgs'][0]}", width: 80,fit: BoxFit.cover,),
                        title: "${fav[index]['p_name']}".text.fontFamily(semibold).size(16).make(),
                        subtitle: "${fav[index]['p_price']}".numCurrency.text.color(Colors.red).fontFamily(semibold).make(),
                        trailing: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ).onTap(() async {
                          await firestore.collection(productsCollection).doc(fav[index].id).set({
                            'p_favlist' : FieldValue.arrayRemove([currentUser!.uid])
                          }, SetOptions(merge: true));
                        }),
                      );
                      }))
                ],
              );
            }
          }),

    );
  }
}
