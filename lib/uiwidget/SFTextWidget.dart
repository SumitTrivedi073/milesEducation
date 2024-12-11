import 'package:flutter/material.dart';

class Sftextwidget extends StatelessWidget {
  final String textval;
  final Color? colorval;
  final FontWeight fontWeight;
  final double sizeval;

  const Sftextwidget(
      {required this.textval,
        required this.colorval,
        required this.sizeval,
        required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return  Text(
      textval,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: sizeval,
          color: colorval,
          fontWeight: fontWeight,
          fontFamily: "SFUIText"),
    );
  }
}