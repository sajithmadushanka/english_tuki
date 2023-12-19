import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseConnectionCheck extends StatefulWidget {
  @override
  _FirebaseConnectionCheckState createState() => _FirebaseConnectionCheckState();
}

class _FirebaseConnectionCheckState extends State<FirebaseConnectionCheck> {
  DatabaseReference? _databaseReference;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() {
    // Replace with your Firebase database URL
    _databaseReference = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Firebase Connection Check',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Check Firebase connection by reading a value from the database
              try {
                await _databaseReference!.child('test').once().then((snapshot) {
                  print('Firebase connection successful!');
                });
              } catch (e) {
                print('Error connecting to Firebase: $e');
              }
            },
            child: Text('Check Connection'),
          ),
        ],
      ),
    );
  }
}