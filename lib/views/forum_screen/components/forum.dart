
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

Widget forumDetail({width, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      title!.text.fontFamily(bold).color(Colors.white).size(16).make(),
      ],

  ).box.color(brownColor).rounded.width(width).height(60).padding(const EdgeInsets.all(4)).make();
}

