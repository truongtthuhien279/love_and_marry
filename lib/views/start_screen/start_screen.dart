import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../welcome_screen/welcome_screen.dart';
import '../widget_common/applogo_widget.dart';
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  // Tạo một cái method để thay đổi screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //sử dụng getX
      Get.to(() => const WelcomeScreen());
    });
  }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            applogoWidget(),

            // Image.asset(
            //   'assets/icons/app_logo.png',
            //   width: 130,
            // ),
            SizedBox(height: 1), // Tạo khoảng cách 10 pixels giữa logo và tên ứng dụng
            appNameLogo.text.fontFamily(fontLogo).fontWeight(FontWeight.bold ).size(22).color(brownColor).make(),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }
}