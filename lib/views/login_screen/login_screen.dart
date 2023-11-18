import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import 'package:love_and_marry_app/views/widget_common/custom_textfield.dart';

import '../../consts/lists.dart';
import '../../controllers/auth_controller.dart';
import '../home_screen/home.dart';
import '../signup_screen/signup_screen.dart';
import '../widget_common/applogo_widget.dart';
import '../widget_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
       child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.05).heightBox,
                  applogoWidget(),
                  "Log in to $appname".text.fontFamily(bold).fontWeight(FontWeight.bold).color(brownColor).size(19).make(),
                  SizedBox(height: 15,),
                  Obx(()=> Column(
                      children: [
                        customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                        customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {}, child: forgetPass.text.make())),
                        5.heightBox,
                        controller.isLoading.value ?
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(brownColor),
                            )
                         :ourButton(
                            color: brownColor,
                            title: login,
                            textColor: whiteColor,
                            onPress: () async {
                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => Home());
                                } else{
                                  controller.isLoading(false);
                                }
                              });
                            }).box.width(context.screenWidth - 50).make(),
                        SizedBox(height: 5,),
                        createNewAccount.text.color(fontGrey).make(),
                        SizedBox(height: 5,),
                        ourButton(
                            color: backgrColor,
                            title: signup,
                            textColor: brownLine,
                            onPress: () {
                              Get.to(() => const SignupScreen());
                            }).box
                            .width(context.screenWidth - 50)
                            .make(),
                        SizedBox(height: 10,),
                        loginWith.text.color(fontGrey).make(),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(socialIconList[index],
                                  width: 30,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(context.screenWidth - 70).shadowSm
                        .make(),
                  ),

              ],
              ),
            ),
          ),
        )
    );
  }
}
