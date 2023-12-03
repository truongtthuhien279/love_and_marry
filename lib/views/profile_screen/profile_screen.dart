import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/favorite_screen/favorite_screen.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';

import '../../consts/firebase_consts.dart';
import '../../consts/lists.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../services/firestore_services.dart';
import '../login_screen/login_screen.dart';
import '../supplier/suplier_categories/categories_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(brownColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];

                return SafeArea(
                    child: Container(
                    padding: EdgeInsets.all(8)
              ,
              child
              :
              Column
              (
              mainAxisAlignment
              :
              MainAxisAlignment
              .
              center
              ,
              crossAxisAlignment
              :
              CrossAxisAlignment
              .
              center
              ,
              children
              :
              [
              //EDIT PROFILE BUTTON
              Padding
              (
              padding
              :
              const
              EdgeInsets
              .
              all
              (
              8.0
              )
              ,
              child
              :
              const
              Align
              (
              alignment
              :
              Alignment
              .
              topRight
              ,
              child
              :
              Icon
              (
              Icons
              .
              edit
              ,
              color
              :
              brownColor
              ,
              )
              ).onTap(() {
              controller.nameController.text = data['name'];

              Get.to(() => EditProfileScreen(data: data));
              }),
              ),
              // users details section

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
              children: [
              data['imageUrl'] == ''
              ? Image.asset(imgProfile,
              width: 70, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
                  : Image.network(data['imageUrl'],
              width: 70, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              SizedBox(
              width: 10,
              ),
              Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              "${data['name']}"
                  .text
                  .fontFamily(semibold)
                  .color(brownColor)
                  .make(),
              "${data['email']}"
                  .text
                  .color(brownColor)
                  .make(),
              ],
              )),
              OutlinedButton(
              onPressed: () async {
              await Get.put(AuthController())
                  .signoutMetod(context);
              VxToast.show(context, msg: loggedout);
              Get.offAll(() => const LoginScreen());
              },
              child: logout.text
                  .fontFamily(semibold)
                  .color(brownColor)
                  .make(),
              )
              ],
              ),
              ),
              20.heightBox,
              //Button section
              ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
              return const Divider(color: lightGrey);
              },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context, int index) {

              return ListTile(

              onTap: (){
              switch(index) {
              case 0:
              Get.to(() => CategoriesScreen());
              //break
              break;
              case 1:
              break;
              case 2:
              Get.to(() => FavoriteScreen());
              break;
              case 3:
              break;
              case 4:
              break;
              case 5:
              break;
              case 6:
              break;
              case 7:
              break;
              default:
              }
              },
                  leading: Image.asset(profileButtonsIcon[index], width: 22,),
                  title: "${profileButtonsList[index]}".text.fontFamily(semibold).color(darkFontGrey).make(),
              );
              }
          )
              .box
              .white
              .rounded
              .margin(EdgeInsets.all(12))
              .padding(EdgeInsets.symmetric(horizontal: 16))
              .shadowSm
              .make()
              .box
              .color(backgrColor)
              .make(),
          ],
        ),
      ),
    );
  }
}),
)
)
);
}
}
