
import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import 'package:love_and_marry_app/views/widget_common/custom_textfield.dart';

import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../widget_common/our_button.dart';

class EditBudgetScreen extends StatelessWidget {
  const EditBudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: editBudget.text.fontFamily(bold).color(brownColor).make(),
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: "When you edit your estimated budget, "
                      "breakdown cost will be recalculated "
                      "automatically and the amount will be "
                      "modified. "
                      .text
                      .fontFamily(semibold)
                      .fontWeight(FontWeight.bold)
                      .size(20)
                      .color(brownLine)
                      .make(),
                ).box.margin(EdgeInsets.only(left: 8)).make(),

                SizedBox(height: 50,),
                Align(
                  alignment: Alignment.topLeft,
                  child: "Total cost: "
                      .text
                      .fontFamily(semibold)
                      .fontWeight(FontWeight.normal)
                      .size(18)
                      .color(brownLine)
                      .make(),
                ).box.margin(EdgeInsets.only(left: 12)).make(),

                SizedBox(height: 10,),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "\$",
                        labelStyle: TextStyle(fontSize: 30),
                        hintText: "420000",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Đặt độ cong ở đây
                          borderSide: BorderSide(color: brownColor),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: brownColor),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){},
                  child: 'Save'.text.fontWeight(FontWeight.bold).minFontSize(25).color(Colors.white).make(),
                  style: ElevatedButton.styleFrom(
                    primary: brownColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)
                    ),
                    minimumSize: Size(150, 50),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
