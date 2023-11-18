import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/controllers/profile_controller.dart';
import 'package:love_and_marry_app/views/profile_screen/profile_screen.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import 'package:love_and_marry_app/views/widget_common/custom_textfield.dart';
import 'package:love_and_marry_app/views/widget_common/our_button.dart';
import '../../consts/images.dart';

class EditProfileScreen extends StatelessWidget {

  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                //if  data image url  and controller  path iss empty
              data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                  ? Image.asset(imgProfile, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()

              //if data is not empty  but  controller path is empty
                  : data['imageUrl'] != '' && controller.profileImagePath.isEmpty
                    ? Image.network(data['imageUrl'], width: 100,
                  fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
              // if both are empty
                    : Image.file(File(controller.profileImagePath.value),width: 100,
                fit: BoxFit.cover,
             ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                  color: brownColor, onPress: (){
                    controller.changeImage(context);
                  // print("object");
                }, textColor: whiteColor, title: "Change"),
               const Divider(),
                20.heightBox,
                customTextField(controller: controller.nameController,hint: nameHint, title: name, isPass: false),
                10.heightBox,
                customTextField(controller: controller.oldpassController,hint: passwordHint, title: oldpass, isPass: true),
                10.heightBox,
                customTextField(controller: controller.newpassController,hint: passwordHint, title: newpass, isPass: true),
                20.heightBox,
                controller.isLoading.value ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(brownColor),
                ) : SizedBox(
                  width: context.screenWidth - 60,
                  child: ourButton(
                      color: brownColor, onPress: () async {

                        controller.isLoading(true);
                        // if image is not selected
                        if (controller.profileImagePath.value.isNotEmpty) {
                          await controller.upLoadProfileImage();
                        }else {
                          controller.profileImageLink = data['imageUrl'];
                        }

                        // if old password matching database
                        if(data['password'] == controller.oldpassController.text){

                          await controller.changeAuthPassword(
                              email: data['email'],
                              password: controller.oldpassController.text,
                              newpassword: controller.newpassController.text
                          );
                          await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpassController.text);
                          VxToast.show(context, msg: "Updated");
                        }else {
                           VxToast.show(context, msg: "Wrong old password");
                           controller.isLoading(false);
                        }




                  }, textColor: whiteColor, title: "Save"),
                ),

              ],
            ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
          ),
        )
    );
  }
}
