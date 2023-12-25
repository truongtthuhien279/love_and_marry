import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';
import '../../consts/strings.dart';
import '../profile_screen/addNewExpense_screen.dart';
import '../widget_common/loading_indicator.dart';
import 'editBudget_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int finalCost = 0;
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
                    child:StreamBuilder(
                      stream: FirestoreServices.getBudget(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: loadingIndicator(),
                          );
                        } else {
                          var data = snapshot.data!.docs;
                          finalCost = data[0]["final_cost"];
                          return Column(
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "Estimated Cost",
                                            style: TextStyle(fontSize: 14,
                                                color: budColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 7),
                                          Text(
                                            "\$1,800.00",
                                            style: TextStyle(fontSize: 23,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
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
                                                decoration: TextDecoration
                                                    .underline,
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "Final Cost",
                                            style: TextStyle(fontSize: 14,
                                                color: budColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 7),
                                          Text(
                                            "\$${finalCost}",
                                            style: TextStyle(fontSize: 23,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 7),
                                          Text(
                                            "Paid: \$800.00",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Pending: \$1,000.00",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ]
                          );
                        }
                      }
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
                                160.widthBox,
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
                                StreamBuilder(
                                  stream: FirestoreServices.getBudget(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                      return Center(
                                        child: loadingIndicator(),
                                      );
                                    } else {
                                      var data = snapshot.data!.docs;
                                      var productIds = data.map((budget) {
                                        return budget['product_id'];
                                        int temporaryFinalCost = 0;
                                      }).toList();
                                      return Column(
                                        children: List.generate(productIds[0].length, (index) {
                                          return StreamBuilder(
                                            stream: FirestoreServices.getProductById(productIds[0][index]),
                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return loadingIndicator();
                                              } else if (snapshot.hasError || snapshot.data == null) {
                                                return Text('Error: ${snapshot.error}');
                                              } else {
                                                var documents = snapshot.data!.docs;
                                                if (documents.isNotEmpty) {
                                                  var product = documents[0].data() as Map<String, dynamic>;
                                                  var pImgs = product["p_imgs"][0];
                                                  var pName = product["p_name"];
                                                  var pPrice = product["p_price"];
                                                      int intPrice = int.parse(pPrice);
                                                      finalCost = finalCost - intPrice;

                                                  return Container(
                                                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.0),
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
                                                            child:Image.network(pImgs ,
                                                                width: 180,
                                                                height: 130,
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
                                                                "$pName"
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
                                                                  "${pPrice}"
                                                                      .toString()
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
                                                  );
                                                } else {
                                                  // Trường hợp không có dữ liệu
                                                  return Text('Không có dữ liệu');
                                                }
                                              }
                                            },
                                          );
                                        }),
                                      );
                                    }
                                  },
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
              ],
            ),
          ),

        ),
      ),
    );
  }

  void handleFinalCostUpdate(int newFinalCost) {
    setState(() {
      finalCost = newFinalCost;
    });
  }
}
