
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

Widget ourButton({onPress, color, textColor,String? title}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(18),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(12)

      ),
      onPressed: onPress,
      child: title!.text.color(
          textColor).fontFamily(bold).make(),
    ),
  );
}