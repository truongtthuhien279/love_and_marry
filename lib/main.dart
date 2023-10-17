import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:love_and_marry_app/consts/colors.dart';
import 'package:love_and_marry_app/views/splash_screen/splash_screen.dart';

import 'consts/strings.dart';

void main() { runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  //nhan da o day
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          // to set app bar icons color
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            backgroundColor: Colors.transparent),
        fontFamily: "sans_regular",
      ),
    );
  }
}

