
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller, isPass}) {
  Color? redColor;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(brownColor).fontFamily(semibold).size(16).make(),
      SizedBox(height: 5,),
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          //border: InputBorder.none,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Đặt độ cong ở đây
  borderSide: BorderSide(color: brownColor),),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: brownColor)),
        ),
      ), SizedBox(height: 5,)
    ],
  );
}