import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:miles_education/utility/constant.dart';

import '../uiwidget/SFTextWidget.dart';
import 'controller/StatusController.dart';

class StatusListWidget extends StatefulWidget {
  @override
  _StatusListWidgetState createState() => _StatusListWidgetState();
}

class _StatusListWidgetState extends State<StatusListWidget> {
  final StatusController controller = Get.put(StatusController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Fixed height for the status bar
      child: Obx(
            () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.statusList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.redAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child:  CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        controller.statusList[index],
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),
                  Flexible(child: Sftextwidget(textval:  "User ${index + 1}", colorval: Colors.white, sizeval: 14, fontWeight: FontWeight.w200)
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}