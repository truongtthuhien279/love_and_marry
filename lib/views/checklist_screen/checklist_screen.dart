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
// Giả sử bạn có một danh sách các giá trị cho thanh dropdown
  List<String> dropdownValues = ['Pending', 'Done', 'All'];
  String selectedDropdownValue = 'Pending'; // Giá trị mặc định
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
        body: Column(
          children: [
            // Phần tiêu đề và thanh dropdown
            SizedBox(
              height: 15,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('Filter by:', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // Thêm padding theo nhu cầu
                      child: DropdownButton<String>(
                        value: selectedDropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedDropdownValue = value!;
                          });
                        },
                        items: dropdownValues
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.black),
                        underline: Container(),
                        isDense: true,
                        iconSize: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            // Phần ListView
            Expanded(
              child: ListView.builder(
                itemCount: 7, // Số lượng hộp bạn muốn tạo
                itemBuilder: (context, index) {
                  // Đối với hộp thứ index + 1
                  return buildChecklistItem(
                      index + 1, checkButtonsList[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChecklistItem(int taskNumber, String taskText, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      // Khoảng cách giữa nội dung và viền hộp
      padding: EdgeInsets.all(20.0),
      // Khoảng cách giữa nội dung và bo góc
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
    left: 270.0, // Chuyển vị trí về gần hơn
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
    color: Colors.brown,
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
    color: Colors.brown,
    fontSize: 15,
    ),
    ),
    ),
    ],
    )
    ,
    ]
    ,
    )
    ,


    );
  }
}
