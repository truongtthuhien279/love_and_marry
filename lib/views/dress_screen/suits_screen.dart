import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

class SuitScreen extends StatelessWidget {
  final String? title;

  const SuitScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).color(Colors.black).make(),
          backgroundColor: Colors.white,

        ),
      ),
    );
  }
}
