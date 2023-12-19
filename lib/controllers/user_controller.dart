import 'package:english_tuki/shared/models/user.dart';
import 'package:english_tuki/shared/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserController{
   static registerUser(String name, String email, String username, String password){
     final UserModel user  = UserModel(name: name, email: email, username: username, password: password);

     FirebaseService.registerUser(user);
    }

    static userLogin(String username, String password){
       print(username);
    }
}