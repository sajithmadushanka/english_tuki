import 'package:english_tuki/controllers/user_controller.dart';
import 'package:english_tuki/shared/base_assets_url.dart';
import 'package:english_tuki/shared/colors.dart';
import 'package:english_tuki/shared/widgets/btn.dart';
import 'package:english_tuki/shared/widgets/text_form_field.dart';
import 'package:english_tuki/user/screens/login.dart';
import 'package:flutter/material.dart';

import '../../shared/sizes.dart';
import 'home.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  //singleton pattern
  void submitBtn(){
    if(_formKey.currentState?.validate() == true){
      print('validated');

      String name = _nameController.text;
      String email = _emailController.text;
      String username = _usernameController.text;
      String password = _passwordController.text;

      UserController.registerUser(name, email, username, password);
    }


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      appBar: AppBar(
        backgroundColor: AppColors.borderColor1,
        title: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Image.asset("${ImagePath.images}logo-1.png", width: 150),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
            const HomeScreen()),
                  (route) => false,
            );
          },
          icon: Icon(Icons.home, color: Colors.white,),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Register",  style: TextStyle(fontFamily:'primary',
                    fontSize:FontSizes.large, fontWeight:FontWeight.bold,
                    color:AppColors.textColor2),),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyFormField(controller: _nameController, hintText: "Name"),
                      MyFormField(controller: _emailController, hintText: "Email"),
                      MyFormField(controller: _usernameController, hintText: "Username"),
                      MyFormField(controller: _passwordController, hintText: "Password", isPassword: true),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                MyButton(name: 'Submit', submitBtn: submitBtn),
          
          
                SizedBox(height: 10),
          
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              }, child:Text("I have an account",  style: TextStyle(fontFamily:'primary',
                  fontSize:FontSizes.small, fontWeight:FontWeight.bold,
                  color:AppColors.textColor2),)
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
