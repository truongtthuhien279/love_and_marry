import 'package:flutter/material.dart';
import 'package:love_and_marry_app/consts/consts.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../login_screen/login_screen.dart';
import '../widget_common/bg_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Welcome to \n       Love & Marry", style: TextStyle(color: brownColor, fontSize: 40,fontWeight: FontWeight.bold ),),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 500,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(imgWC1, width: 500, fit: BoxFit.fill,)
                  ),
                ),
                SizedBox(height: 50),

                //nút get start
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: brownColor,
                  ),

                  //Image.asset(imgWC1, width: 500,),


                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        //minWidth: 20,
                        minWidth: double.infinity,
                        child: Text("Get Start", style: TextStyle(color: backgrColor,fontFamily: bold, fontSize: 25),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
    );
  }
}
