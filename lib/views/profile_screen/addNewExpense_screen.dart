import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/firebase_consts.dart';
import 'package:love_and_marry_app/controllers/services_controller.dart';
import 'package:love_and_marry_app/services/firestore_services.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';

import '../../consts/strings.dart';
class AddNewExpenseScreen extends StatefulWidget {
  const AddNewExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddNewExpenseScreen> createState() => _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends State<AddNewExpenseScreen> {
  String? selectedCategory;
  final FocusNode _productNameFocus = FocusNode();
  TextEditingController _productNameController = TextEditingController();
  final TextEditingController _conceptController = TextEditingController();
  ServiceController controller = new ServiceController();
  late var price;
  // Function to handle product search
  Future<void> searchProduct() async {
    try {
      if(_productNameController.text.isEmpty){
        VxToast.show(context, msg: "Product name is empty!");
        return;
      }
      try{
        if(selectedCategory!.isEmpty){
          VxToast.show(context, msg: "Category is empty!");
          return;
        }
      }  catch (e) {
        VxToast.show(context, msg: "Category is empty!");
      }
      DocumentSnapshot? productSnapshot =
      await ServiceController.getProductPrice(_productNameController.text, selectedCategory!);
      if (productSnapshot != null && productSnapshot.exists) {
        var productData = productSnapshot.data() as Map<String, dynamic>;
        var productPrice = productData['p_price'];
        print("====== " + productPrice);
        price = productPrice;
        setState(() {
          _conceptController.text = productPrice.toString();
        });
      } else {
        // Product not found, handle accordingly
        print('Product not found');
      }
    } catch (e) {
      print('Error searching for product: $e');
      // Handle the error as needed
    }
  }

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
                  child: "Product name"
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
                      controller: _productNameController,
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
                        suffixIcon: Icon(Icons.search).onTap(() {
                          FocusScope.of(context).requestFocus(_productNameFocus);
                          setState(() {
                            searchProduct();
                          });
                        }), // Thêm biểu tượng tìm kiếm
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: "Catagory"
                            .text
                            .fontFamily(semibold)
                            .fontWeight(FontWeight.normal)
                            .size(18)
                            .color(brownLine)
                            .make(),
                      ).box.margin(EdgeInsets.only(left: 5)).make(),
                      0.widthBox,
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      children: [
                       StreamBuilder(
                           stream:  FirestoreServices.getCategory(),
                           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                             if (snapshot.hasError) {
                               return Text('Error: ${snapshot.error}');
                             }
                             if (!snapshot.hasData) {
                               return CircularProgressIndicator(); // Loading indicator
                             }
                             var categories = snapshot.data!.docs;
                             return  Container(
                               padding: EdgeInsets.symmetric(horizontal: 12),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 border: Border.all(color: brownColor),
                                 color: Colors.white,
                               ),
                                 child: DropdownButtonHideUnderline(
                                   child: DropdownButton<String>(
                                     hint: Text(
                                       'Select Category',
                                       style: TextStyle(color: Colors.grey, fontSize: 18),
                                     ),
                                     value: selectedCategory,
                                     onChanged: (String? value) {
                                       setState(() {
                                         selectedCategory = value;
                                       });
                                     },
                                     items: categories.map((category) {
                                       var categoryName = category['s_name']; // Change to your field name
                                       return DropdownMenuItem<String>(
                                         value: categoryName,
                                         child: Text(categoryName),
                                       );
                                     }).toList(),
                                   ),
                                 ),
                             );

                           })
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: "Price"
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
                      controller: _conceptController,
                      decoration: InputDecoration(
                        hintText: "\$",
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
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: (){
                    print(price);
                    if(price != null)
                      {
                        setState(() {
                          controller.addToBudget(_productNameController.text, selectedCategory!);
                          //mặc định lại giá trị cho input
                          _productNameController.clear();
                          _conceptController.clear();
                          price = null;
                          selectedCategory = null;
                          VxToast.show(context, msg: "Save Success");
                        });
                      }
                    else{
                      VxToast.show(context, msg: "Save Failed!");
                    }
                  },
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
