import 'package:english_tuki/shared/base_assets_url.dart';
import 'package:english_tuki/shared/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1 , color: AppColors.borderColor3),
            ),
            child: Center(
              //main image
              child:Image.asset("${ImagePath.images}splash-main.png",width: 240,)

            ),
          ),

          // logo
          Center(
            child: Image.asset("${ImagePath.images}logo-with-sogan.png", width: 200),
          ),

          // btn
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              width: 60,
              height: 60,

              decoration: BoxDecoration(
                color: AppColors.backgroundColor2,
                shape:BoxShape.circle,
                border: Border.all(width: 1 , color: AppColors.borderColor3),
               boxShadow: [
                      BoxShadow(
                      color: AppColors.borderColor3.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 0), // changes position of shadow
                      ),
                      ],
              ),
              child: Center(
                child: Image.asset("${ImagePath.images}right.png", width: 30,)
              ),
            ),
            onTap: ()=>{
              // Navigator.push(context, ()=>HomeScreen)
            },
          )
        ],
      ),
    );
  }
}
