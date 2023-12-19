import 'package:flutter/material.dart';

import '../colors.dart';
import '../sizes.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({super.key, required this.controller, required this.hintText, this.isPassword = false});
    final TextEditingController controller;
    final String hintText;
    final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(fontFamily:'primary',
            fontSize:FontSizes.large, fontWeight:FontWeight.bold,
            color:AppColors.textColor1),
        decoration: InputDecoration(
          border:UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText ,

        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your ${hintText.toLowerCase()}';
          }
          return null;
        },
      ),
    );
  }
}
