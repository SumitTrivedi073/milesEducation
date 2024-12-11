import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miles_education/home/videoPlayerWidget.dart';
import 'package:miles_education/theme/appColor.dart';
import 'package:miles_education/uiwidget/SFTextWidget.dart';
import 'package:miles_education/utility/utility.dart';

import '../utility/constant.dart';
import 'model/dataList.dart';

class ItemListWidget extends StatefulWidget {
  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
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

      // print('arrtrip====>${dataList!.data.length}');
    });
    //print(jsonData);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPosts();
  }


  Widget _buildPosts() {
    return ListView.builder(
        itemCount: dataList?.data.length, // Static number of items
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){

                if(dataList?.data[index].blockType.toString().compareTo(reels) == 0 ||
                    dataList?.data[index].blockType.toString().compareTo(inshorts) == 0) {

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerWidget(
                                datum: dataList!.data[index].posts[0].files[0],
                              )),
                          (Route<dynamic> route) => true);
                }


          },
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  dataList?.data[index].posts[0].files[0]
                .imagePath != null ? Utility().getNetworkImage(context,
                dataList?.data[index].posts[0].files[0].imagePath)
                  : Container(
                child: Column(children: [
                  dataList?.data[index].blockType.compareTo(reels)==0? titleWidget("The Global Accountant"):
                  titleWidget("Upcoming Events"),
                  Container(
                    child: dataList?.data[index].posts[0].files[0]
                        .thumbnail != null ? Utility().getNetworkImage(context,
                        dataList?.data[index].posts[0].files[0].thumbnail):SizedBox(),
                  )
                ],)))));

          /*dataList?.data[index].posts[0].files[0].imagePath!=null?Utility().getNetworkImage(context, dataList?.data[index].posts[0].files[0].imagePath):Container(height: 200,
                    color: Colors.red,)*/

        });
  }

  ListItemWidget(int index) {
    print("blockType====>${dataList?.data[index].blockType}");
    if(dataList?.data[index].blockType.toString().trim().compareTo(banner)==0) {
      return dataList?.data[index].posts[0].files[0]
          .imagePath != null
          ?
      Utility().getNetworkImage(context,
          dataList?.data[index].posts[0].files[0].imagePath)
          : const SizedBox();
    }

    if(dataList?.data[index].blockType.toString().trim().compareTo(reels)==0) {
      return Row(children: [
        Container(
          height: 150,
          child: dataList?.data[index].posts[0].files[0]
              .thumbnail != null
              ?
          Utility().getNetworkImage(context,
              dataList?.data[index].posts[0].files[0].thumbnail)
              : const SizedBox(),
        )
      ],);
    }

    if(dataList?.data[index].blockType.toString().trim().compareTo(inshorts)==0) {
      return Row(children: [
        Container(
          height: 150,
          child: dataList?.data[index].posts[0].files[0]
              .thumbnail != null
              ?
          Utility().getNetworkImage(context,
              dataList?.data[index].posts[0].files[0].thumbnail)
              : const SizedBox(),
        )
      ],);
    }
  }

  titleWidget(String title) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Padding(padding: EdgeInsets.all(10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Sftextwidget(textval: title, colorval: Colors.white, sizeval: 14, fontWeight: FontWeight.w600),
        /*SvgPicture.asset(
        "assets/svg/arrow.svg",
        width: 20,
        height: 5,
      ),*/


      ],),),
    );
  }
}



/*ListItemWidget(DataList? dataList, int index) {
    if (dataList?.data[index].blockType.toString().compareTo(banner) == 0) {
      return dataList!.data[index].posts[0].files[0].imagePath!=null?Utility().getNetworkImage(context, dataList.data[index].posts[0].files[0].imagePath):SizedBox();
    }
    if (dataList?.data[index].blockType.toString().compareTo(reels) == 0) {
      return dataList!.data[index].posts[0].files[0].thumbnail!=null?SizedBox(width: MediaQuery.of(context).size.width/2,
      height: 200,child: Utility().getNetworkImage(context, dataList.data[index].posts[0].files[0].thumbnail)):SizedBox();
    }

    if (dataList?.data[index].blockType.toString().compareTo(inshorts) == 0) {
      return dataList!.data[index].posts[0].files[0].thumbnail!=null?Utility().getNetworkImage(context, dataList.data[index].posts[0].files[0].thumbnail):SizedBox();
    }
  }

  bannerWidget(List<FileElement> files) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      color: Colors.redAccent,
    );
  }
*/



