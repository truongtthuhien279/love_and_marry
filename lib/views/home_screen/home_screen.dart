import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_and_marry_app/consts/colors.dart';
import 'package:love_and_marry_app/consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [

          Container(
          width: 303,
          height: 31,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15), border:  Border.all(color: darkFontGrey),
            color:  whiteColor,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Image(image: AssetImage(icSearch)),
                filled: true,
                hintText: searchResort,
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
          ],
        ),
        ),
    );
  }
}
