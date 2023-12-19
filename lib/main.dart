
import 'package:english_tuki/shared/services/provider.dart';
import 'package:english_tuki/user/screens/splash.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 try{
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   print('Firebase connected successfully!');
   runApp(
     ChangeNotifierProvider(
       create: (context) => CategoryDataProvider(),
       child: const MyApp(),
     ),
   );
 }catch(e){
   print('Firebase connection failed: $e');
 }
  // runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

