import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import 'package:love_and_marry_app/views/widget_common/custom_textfield.dart';

import '../../consts/lists.dart';
import '../home_screen/home.dart';
import '../signup_screen/signup_screen.dart';
import '../widget_common/applogo_widget.dart';
import '../widget_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.05).heightBox,
                applogoWidget(),
                "Log in to $appname".text.fontFamily(bold).fontWeight(FontWeight.bold).color(brownColor).size(19).make(),
                SizedBox(height: 15,),
                Column(
                  children: [
                    customTextField(hint: emailHint, title: email),
                    customTextField(hint: passwordHint, title: password),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {}, child: forgetPass.text.make())),
                    SizedBox(height: 5,),
                    ourButton(
                        color: brownColor,
                        title: login,
                        textColor: backgrColor,
                        onPress: () {
                          Get.to(() => const Home());
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

            ],
            ),
          ),
        )
    );
  }
}