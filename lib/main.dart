import 'package:flutter/material.dart';
import 'package:flutter_persistence_example/screens/dashboard.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.blue[500],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[500],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Dashboard()
    );
  }

