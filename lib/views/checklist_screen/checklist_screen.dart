import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/consts/list.dart';
import 'package:love_and_marry_app/consts/lists.dart';
import 'package:love_and_marry_app/views/home_screen/home.dart';
import 'package:love_and_marry_app/views/home_screen/home_screen.dart';

import '../../consts/colors.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({Key? key}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}
class ChecklistItem {
  String taskText;
  bool isSelected;

  ChecklistItem({required this.taskText, this.isSelected = false});
}
List<ChecklistItem> checkItems = List.generate(7, (index) {
  return ChecklistItem(taskText: checkButtonsList[index]);
});
class _CheckListScreenState extends State<CheckListScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: creamColor,
      width: context.screenWidth,
      height: context.screenHeight,
        child: Scaffold(
          appBar: AppBar(
            title: GestureDetector(
        onTap: () {
      // Xử lý khi tiêu đề được nhấp vào (điều hướng về trang Home)
      //Navigator.of(context).pop(); // Điều hướng về trang Home
          Get.to(() => const HomeScreen());
    },
             child: Text(
                // 'Checklist',
               "Check List",
                 style: TextStyle(color: brownColor),
            ),
            ),
             backgroundColor: Colors.white,

            // leading: IconButton(
            //   icon: Icon(
            //     Icons.arrow_back,
            //     color: brownColor,
            //   ),
            //   onPressed: () {
            //     Get.to(() => const HomeScreen());
            //   },
            // ),
          ),
    body: ListView.builder(
    itemCount: 7, // Số lượng hộp bạn muốn tạo
    itemBuilder: (context, index) {
    return buildChecklistItem(index + 1, checkButtonsList[index], index);
    },
    ),
        ),
    );
  }



  Widget buildChecklistItem(int taskNumber, String taskText, int index) {

      return Container(
      margin: EdgeInsets.all(10.0), // Khoảng cách giữa nội dung và viền hộp
      padding: EdgeInsets.all(20.0), // Khoảng cách giữa nội dung và bo góc
      decoration: BoxDecoration(
        // color: lightGolden,
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          )
        ],
      ),


        child: Stack(
          children: [
          // Biểu tượng hình tròn ở góc trái
          Positioned(
          left: 300.0,
          top: 10.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                checkItems[index].isSelected = !checkItems[index].isSelected;
              });
              // Xử lý khi người dùng chọn biểu tượng hình tròn
            },
            child: Icon(
              checkItems[index].isSelected
                  ? Icons.circle_sharp
                  : Icons.circle_outlined,
              size: 30,
              // color: Colors.blue,
              color: Colors.orange[600],
            ),
          ),
          ),

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task $taskNumber',
            style: TextStyle(
              color: brownColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Container(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: Text(
              taskText,
              style: TextStyle(
                color: brownColor,
                fontSize: 15,

              ),
            ),
          ),

        ],
    ),
     ],
        ),



    );
  }
}

