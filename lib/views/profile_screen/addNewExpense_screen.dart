import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';

import '../../consts/strings.dart';
class AddNewExpenseScreen extends StatelessWidget {
  const AddNewExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: newExpenseB.text.fontFamily(bold).color(brownColor).make(),
          backgroundColor: Colors.white,
        ),



        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: "Category "
                      .text
                      .fontFamily(semibold)
                      .fontWeight(FontWeight.normal)
                      .size(18)
                      .color(brownLine)
                      .make(),
                ).box.margin(EdgeInsets.only(left: 12)).make(),



                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Wedding Dress",
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
                        // suffixIcon: Icon(Icons.arrow_drop_down), // Icon sổ xuống
                        suffixIcon: PopupMenuButton<String> (
                          onSelected: (String selectedItem) {
                            // Handle the selected item
                            // ...
                            if (selectedItem == 'pending') {
                              // Perform action for pending selection
                            } else if (selectedItem == 'done') {
                              // Perform action for done selection
                            } else if (selectedItem == 'all') {
                              // Perform action for all selection
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'pending',
                                child: Text('Pending'),
                              ),
                              PopupMenuItem<String>(
                                value: 'done',
                                child: Text('Done'),
                              ),
                              PopupMenuItem<String>(
                                value: 'all',
                                child: Text('All'),
                              ),
                            ];
                          },
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: "Expense"
                      .text
                      .fontFamily(semibold)
                      .fontWeight(FontWeight.normal)
                      .size(18)
                      .color(brownLine)
                      .make(),
                ).box.margin(EdgeInsets.only(left: 12)).make(),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name of the concept",
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

                SizedBox(height: 45,),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: "Estimated Cost"
                            .text
                            .fontFamily(semibold)
                            .fontWeight(FontWeight.normal)
                            .size(18)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 5)).make(),
                      0.widthBox,
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: "Final Cost"
                            .text
                            .fontFamily(semibold)
                        //.fontWeight(FontWeight.bold)
                            .size(18)
                            .color(brownLine)
                            .make(),
                      )
                          .box
                          .margin(EdgeInsets.only(left: 12))
                          .padding(EdgeInsets.only(left: 70))
                          .make(),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "\$",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: brownColor),
                            ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: brownColor),
                              ),
                          ),
                        )
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "\$",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: brownColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: brownColor),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40,),
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
