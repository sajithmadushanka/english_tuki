import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../services/provider.dart';
import '../sizes.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.name, required this.submitBtn});
  final String name;
  final VoidCallback submitBtn;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidthPercentage = 90;
    double widgetWidth = screenWidth * (widgetWidthPercentage / 100);

      return
      GestureDetector(
      onTap: (){
        submitBtn();
      },
      child: Container(
        width: widgetWidth - 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderColor1.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(name,
            style: TextStyle(fontFamily:'primary',
                fontSize:FontSizes.exLarge, fontWeight:FontWeight.bold,
                color:AppColors.textColor2),
          ),
        ),
      ),
      );
  }
}
