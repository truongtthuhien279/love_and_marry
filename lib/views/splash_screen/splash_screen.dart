import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/home_screen/home.dart';
import '../../consts/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //Creating a method to change scscreen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //using getX;
      Get.to(() => const Home());
    });
  }

  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamColor,
      body: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(imgLoading, width: 300,),),
            // SizedBox(height:20 ,),
            // applogoWidget(),
            // SizedBox(height: 10,),
            appname.text
                .fontFamily(bold)
                .size(22)
                .white
                .make(),
          ],
        ),
      ),
    );
  }
}