import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/controllers/home_controller.dart';
import 'package:love_and_marry_app/views/checklist_screen/checklist_screen.dart';
import 'package:love_and_marry_app/views/dress_screen/dress_screen.dart';
import 'package:love_and_marry_app/views/forum_screen/forum_screen.dart';
import 'package:love_and_marry_app/views/profile_screen/profile_screen.dart';

import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    //init home controller
    var controller = Get.put(HomeController());
    var navbarItem = [
    BottomNavigationBarItem(icon: Image.asset(icHome, width: 22), label: home)
    ,
    BottomNavigationBarItem(icon: Image.asset(icCheckList, width: 22), label: checklist),
    BottomNavigationBarItem(icon: Image.asset(icDress, width: 22), label: dress),
    BottomNavigationBarItem(icon: Image.asset(icForum, width: 22), label: forum),
    BottomNavigationBarItem(icon: Image.asset(icProfile, width: 22), label: profile)
    ];
    var narBody = [
     const HomeScreen(),
      const CheckListScreen(),
      const DressScreen(),
      const ForumScreen(),
      const ProfileScreen(),

    ];

    return Scaffold(
    body: Column(
      children: [
       Obx(() => Expanded(
         child: narBody.elementAt(controller.currenNavIndex.value),
       ), )
      ],
    ),
    bottomNavigationBar: Obx(() =>
      BottomNavigationBar(
        currentIndex: controller.currenNavIndex.value,
        selectedItemColor: brownLine,
      selectedLabelStyle: TextStyle(fontFamily: bold),
      type: BottomNavigationBarType.fixed,
      items: navbarItem,
      onTap: (value) {
        controller.currenNavIndex.value = value;
      },
    ),
    ),
    );
  }
}
