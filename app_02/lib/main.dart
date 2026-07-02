import 'package:app_02/MyButton.dart';
import 'package:app_02/MyButton_P3.dart';
import 'package:flutter/material.dart';
import 'MyScaffold.dart';
import 'MyAppBar.dart';
import 'MyText.dart';
import 'MyContainer.dart';
import 'MyColumnAndRow.dart';
import 'MyButton.dart';
import 'MyButton_P2.dart';
import 'MyButton_P3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyButton_P3(),
    );
  }
}


