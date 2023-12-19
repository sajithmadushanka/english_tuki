import 'package:english_tuki/controllers/user_controller.dart';
import 'package:english_tuki/user/screens/register.dart';
import 'package:flutter/material.dart';

import '../../shared/base_assets_url.dart';
import '../../shared/colors.dart';
import '../../shared/sizes.dart';
import '../../shared/widgets/btn.dart';
import '../../shared/widgets/text_form_field.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  authentication(){
    if(_formKey.currentState?.validate() == true){
      String username = _usernameController.text;
      String password = _passwordController.text;
      UserController.userLogin(username, password);
    }

  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      appBar: AppBar(
          backgroundColor: AppColors.borderColor1,
          title: Container(
            margin: EdgeInsets.only(bottom: 10),
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

      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text("Login",  style: TextStyle(fontFamily:'primary',
                    fontSize:FontSizes.large, fontWeight:FontWeight.bold,
                    color:AppColors.textColor2),),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyFormField(controller: _usernameController, hintText: "Username"),
                      MyFormField(controller: _passwordController, hintText: "Password", isPassword: true),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                MyButton(name: 'Login', submitBtn: authentication),


                SizedBox(height: 10),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                }, child:Text("I don't have an account",  style: TextStyle(fontFamily:'primary',
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
