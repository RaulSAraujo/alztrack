import 'package:alztrack/screen/LoginPage.dart';
import 'package:flutter/material.dart';

import 'screen/mainFormPage.dart';

void main() {
  runApp(AlzheimerApp());
}

class AlzheimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlzTrack',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.teal[50],
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black87),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
