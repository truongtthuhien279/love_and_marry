import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/lists.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';

import '../../consts/strings.dart';
import '../profile_screen/addNewExpense_screen.dart';
import 'editBudget_screen.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: budget.text.fontFamily(bold).color(brownColor).make(),
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(height: 10,),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                       Row(
                        children: [
                          Container(
                            width: 170,
                            height: 130,
                            decoration: BoxDecoration(
                              color: budColor1,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Estimated Cost",
                                  style: TextStyle(fontSize:14, color: budColor, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  "\$1,800.00",
                                  style: TextStyle(fontSize:23, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => EditBudgetScreen());
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 170,
                            height: 130,
                            decoration: BoxDecoration(
                              color: budColor2,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Final Cost",
                                  style: TextStyle(fontSize:14, color: budColor, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  "\$1,800.00",
                                  style: TextStyle(fontSize:23, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  "Paid: \$800.00",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Pending: \$1,000.00",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
          ]
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: [
                      // Orange frame
                      Container(
                        width: 700,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: budColor3,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          color: budColor3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: "Your Budget"
                                      .text
                                      .fontFamily(semibold)
                                      .fontWeight(FontWeight.bold)
                                      .size(23)
                                      .color(brownLine)
                                      .make(),
                                ).box.margin(EdgeInsets.only(left: 12,top: 16)).make(),
                                180.widthBox,
                                GestureDetector(
                                  onTap: (){
                                    Get.to(() => AddNewExpenseScreen());
                                  },
                                  child: Image.asset(
                                    icAdd2,
                                    width: 25,
                                    height: 25,
                                  ).box.margin(EdgeInsets.only(top: 16)).make(),
                                ),
                              ],
                            ),
                            SizedBox(height: 25,),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  // thêm streambuilder vào đây

                                  Container(
                                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Đặt border radius ở đây
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: budColor4,
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.0),
                                            // Đặt border radius cho hình ảnh
                                            child: Image.asset(icdressB,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        10.widthBox,
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                "Dress"
                                                    .text
                                                    .size(15)
                                                    .fontWeight(FontWeight.bold)
                                                    .make(),
                                              ],
                                            ),
                                            10.heightBox,
                                            SingleChildScrollView(
                                              child: Row(
                                                children: [
                                                  "\$"
                                                      .text
                                                      .size(16)
                                                      .fontWeight(FontWeight.normal)
                                                      .make(),
                                                  8.widthBox,
                                                  "10000"
                                                      .text
                                                      .size(14)
                                                      .fontWeight(FontWeight.normal)
                                                      .make(),
                                                  10.widthBox,
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
