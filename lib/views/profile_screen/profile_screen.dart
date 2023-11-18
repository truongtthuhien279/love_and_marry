import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';
import 'package:love_and_marry_app/views/widget_common/bg_widget.dart';

import '../../consts/lists.dart';
import '../supplier/suplier_categories/categories_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
       Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //EDIT PROFILE BUTTON
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.edit, color:brownColor,)).onTap(() { }),
                ),


                Row(
                  children: [
                    Image.asset(imgProfile, width: 70, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    SizedBox(width: 10,),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Phong Tran".text.fontFamily(semibold).color(brownColor).make(),
                            "Tranlephong@gmail.com".text.color(brownColor).make(),
                      ],
                    )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: brownColor,
                            )),
                        onPressed: () {},
                        child: logout.text.fontFamily(semibold).color(brownColor).make()
                    ),
                  ],
                ),
                SizedBox(height: 65,),

                //Button section
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(color: lightGrey);
                  },
                  itemCount: profileButtonsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool isFavourite = profileButtonsList[index] == "Favourite";
                    bool isBudget = profileButtonsList[index] == "Budget";
                    bool isSuppliers = profileButtonsList[index] == "Suppliers";
                    return ListTile(
                      leading: Image.asset(
                          profileButtonsIcon[index],
                          width: 22
                      ),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      onTap: (){
                        // Nếu là "Suppliers", chuyển đến trang Categories
                        if(isSuppliers) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoriesScreen()),
                          );
                        }
                      },
                    );
                  },
                ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(backgrColor).make(),
              ],

            ),
          ),),
        ),
      )
    );
  }
}