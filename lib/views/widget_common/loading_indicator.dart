import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/colors.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(brownColor),
  );
}