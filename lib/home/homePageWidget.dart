import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miles_education/home/model/dataList.dart';
import 'package:miles_education/home/statusListWidget.dart';

import '../theme/appColor.dart';
import '../theme/string.dart';
import '../uiwidget/SFTextWidget.dart';
import 'ItemListWidget.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonData;
  DataList? dataList;


  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  Future<void> loadJsonAsset() async {
    final String jsonString =
    await rootBundle.loadString('assets/data/homepage.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;

      dataList = DataList.fromJson(jsonData);
    });
    //print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Space out the widgets
            children: [
              // App Logo or Icon
              SvgPicture.asset(
                "assets/svg/logo.svg",
                width: 30,
                height: 30,
              ),
              SvgPicture.asset(
                "assets/svg/notification.svg",
                width: 30,
                height: 40,
              ) // App title
              // Action Icons
            ],
          ),
        ),
        body: RefreshIndicator(
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Sftextwidget(
                              textval: goodMorning,
                              colorval: Colors.white,
                              sizeval: 18,
                              fontWeight: FontWeight.w200),
                          Sftextwidget(
                              textval: shivam,
                              colorval: Colors.white,
                              sizeval: 16,
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        // Adjust to fit the FloatingActionButton size
                        height: 100,
                        child: Image.asset(
                          'assets/images/call_button.gif', // Path to your GIF
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  StatusListWidget(),
                  // _buildPosts()
                  Expanded(
                    child: ItemListWidget(),
                  ),
                ],
              ),
            ),
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 2), () {
                setState(() {

                });
              },
                // This trailing comma makes auto-formatting nicer for build methods.
              );
            }));
  }
}
