import 'package:flutter/material.dart';
import 'package:flutter_portalberita/ui/constant/colors.dart';
import 'package:flutter_portalberita/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackground),
      home: HomePage(),
    );
  }
}