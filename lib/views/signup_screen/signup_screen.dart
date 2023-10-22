import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';

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
                "Join to $appname".text.fontFamily(bold).fontWeight(FontWeight.bold).color(brownColor).size(19).make(),
                SizedBox(height: 15,),
                Column(
                  children: [
                    customTextField(hint: emailHint, title: email),
                    customTextField(hint: passwordHint, title: password),
                    customTextField(hint: passwordHint, title: password),
                    customTextField(hint: passwordHint, title: retypePassword),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {}, child: alreadyHaveAccount.text.make())),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: brownColor,
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
                    SizedBox(height: 5,),
                    ourButton(
                        color: brownColor,
                        title: signup,
                        textColor: backgrColor,
                        onPress: () {
                          Get.to(() => const Home());
                        }).box.width(context.screenWidth - 50).make(),

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
