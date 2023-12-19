import 'package:english_tuki/user/screens/home.dart';
import 'package:flutter/material.dart';

import '../../shared/base_assets_url.dart';
import '../../shared/colors.dart';
import '../../shared/sizes.dart';
import '../../shared/widgets/btn.dart';
import '../../shared/widgets/text_form_field.dart';
class SuggestionForm extends StatefulWidget {
  const SuggestionForm({super.key});

  @override
  State<SuggestionForm> createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  saveData() {
    if (_formKey.currentState?.validate() == true) {
      print("save form data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
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
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      """Our app is meticulously crafted to establish an optimal learning environment for enhancing English language proficiency. We provide a diverse range of free content accessible to everyone, cultivating an inclusive community committed to achieving language excellence. We welcome your feedback, including bug reports and suggestions, to continually enhance your experience with our app.""",
                      style: TextStyle(fontFamily:'primary',
                        fontSize:FontSizes.extraSmall,
                        color:AppColors.textColor1),),
                  ),
                ),
                    const SizedBox(height: 10,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyFormField(controller: _nameController, hintText: "your name"),
                      MyFormField(controller: _emailController, hintText: "your email"),
                      MyFormField(controller: _usernameController, hintText: "comment title"),
        
                      TextFormField(
                        controller: _messageController,
                        minLines: 4, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        style: TextStyle(fontFamily:'primary',
                            fontSize:FontSizes.small,
                            color:AppColors.textColor1),
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(),
                          hintText:'your massage here....'
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(name: 'Submit', submitBtn: saveData),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
