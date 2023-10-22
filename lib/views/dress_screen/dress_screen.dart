import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';

class DressScreen extends StatelessWidget {
  const DressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 303,
                height: 31,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: darkFontGrey),
                  color: whiteColor,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Image(image: AssetImage(icSearch)),
                      filled: true,
                      hintText: "",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}