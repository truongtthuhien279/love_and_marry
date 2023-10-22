import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/images.dart';



Widget applogoWidget() {
  //sử dụng velcoity_X ở đây
  return Image.asset(icAppLogo).box.size(134,134).padding(EdgeInsets.all(8)).make();

}