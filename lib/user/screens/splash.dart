import 'package:english_tuki/shared/base_assets_url.dart';
import 'package:english_tuki/shared/colors.dart';

import 'package:english_tuki/user/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to the home page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            //main image
            child:Image.asset("${ImagePath.images}splash-main2.png",width: 300,)

          ),

          // logo
          Center(
            child: Image.asset("${ImagePath.images}logo-with-sogan.png", width: 250),
          ),

          // btn
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 80,
              height: 80,

              decoration: BoxDecoration(
                color: AppColors.backgroundColor2,
                shape:BoxShape.circle,
                border: Border.all(width: 1 , color: AppColors.borderColor3),
               boxShadow: [
                      BoxShadow(
                          color: AppColors.borderColor3.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 0), // changes position of shadow
                      ),
                      ],
              ),
              child: Center(
                child: Image.asset("${ImagePath.images}right.png", width: 30,)
              ),
            ),
            onTap:()=>{
              // getData()
              //     checkData()
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
            },
          )
        ],
      ),
    );
  }
}
