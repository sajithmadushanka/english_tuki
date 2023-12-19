import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class FirebaseService{
  static Future<void> registerUser(UserModel user) async {
    try {
      // Firebase email & password registration
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password,
      );

      // Data storage in Firestore (replace with your collection name)
      final usersRef = FirebaseFirestore.instance.collection('users');
      await usersRef.doc(FirebaseAuth.instance.currentUser!.uid).set({
        'name': user.name,
        'username': user.username,
        'email': user.email,
      });

      print('User ${user.name} registered successfully!');
    } catch (error) {
      print('Registration error: $error');
    }
  }
}