import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/controllers/auth_controller.dart';

import '../../consts/firebase_consts.dart';
import '../../consts/lists.dart';
import '../home_screen/home.dart';
import '../widget_common/applogo_widget.dart';
import '../widget_common/bg_widget.dart';
import '../widget_common/custom_textfield.dart';
import '../widget_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child:  Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.05).heightBox,
                  applogoWidget(),
                  "Join to $appname".text.fontFamily(bold).fontWeight(FontWeight.bold).color(brownColor).size(19).make(),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                      customTextField(hint: emailHint, title: email, controller: emailController,isPass: false),
                      customTextField(hint: passwordHint, title: password, controller: passwordController,isPass: true),
                      customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController,isPass: true),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: alreadyHaveAccount.text.make())),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: brownColor,
                            checkColor: Colors.white,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: RichText(text:  const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                      text: termAndCond,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: brownColor,
                                      )),
                                  TextSpan(
                                      text: " & ",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: fontGrey,
                                      )),
                                  TextSpan(
                                      text: privacyPolicy,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: brownColor,
                                      )),
                                ]
                            )),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      controller.isLoading.value? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(brownColor),
                      ) :
                      ourButton(
                        color: isCheck == true ? brownColor : lightGrey,
                          title: signup,
                          textColor: backgrColor,
                          onPress: () async {
                            if(isCheck !=false){
                              controller.isLoading(true);
                              try{
                                await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                                  return controller.storeUserData(
                                    email:emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                  );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(()=>Home());
                                });
                              }
                              catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoading(false);
                              }
                            }
                          },).box.width(context.screenWidth - 50).make(),

                      ],
                    ).box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(context.screenWidth - 70).shadowSm
                        .make(),
                ],
                  ),


              ),
            ),
          ),
    );
  }
}
