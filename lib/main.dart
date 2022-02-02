import 'package:flutter/material.dart';
import 'package:smart_home/my_pages/my_home_page.dart';
import 'package:smart_home/my_pages/my_second_page.dart';
import 'package:smart_home/my_pages/my_third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
