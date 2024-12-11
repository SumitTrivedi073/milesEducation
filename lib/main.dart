import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miles_education/bottomNavigation/BottomNavDemo.dart';
import 'package:miles_education/home/ItemListWidget.dart';
import 'package:miles_education/home/model/dataList.dart';
import 'package:miles_education/theme/appColor.dart';
import 'package:miles_education/theme/string.dart';
import 'package:miles_education/uiwidget/SFTextWidget.dart';
import 'home/statusListWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavDemo(),
    );
  }
}







