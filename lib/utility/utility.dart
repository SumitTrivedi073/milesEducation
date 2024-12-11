
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/appColor.dart';
import 'constant.dart';
Utility utility = Utility();
class Utility {
  void showInSnackBar({required String value, context, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
        duration: duration ?? const Duration(milliseconds: 3000),
      ),
    );
  }

  getNetworkImage(context, path) {
    if (path != null && path != null) {
      return Image.network(encodeImgURLString(path),
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              placeHolderImage,
            );
          }, fit: BoxFit.fill);
    } else {
      return Container(
        color: AppColor.white,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          placeHolderImage,
        ),
      );
    }
  }


  String encodeImgURLString(tmp) {
    String endStr =
    tmp != null && tmp != '' ? Uri.encodeFull(tmp).trim() : placeHolderImage;
    return endStr;
  }

  String? extractYouTubeVideoId(String url) {
    final regExp = RegExp(
      r'(?:v=|\/)([0-9A-Za-z_-]{11}).*',
      caseSensitive: false,
      multiLine: false,
    );

    final match = regExp.firstMatch(url);
    return match?.group(1);
  }

}




