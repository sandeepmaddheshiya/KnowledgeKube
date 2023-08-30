import 'package:flutter/material.dart';

Widget headingText({
  String? text,
  Color? color,
  double? size,
}) {
  return Text(
    text!,
    style: TextStyle(
      fontFamily: "quick_bold",
      fontSize: size,
      color: color,
    ),
  );
}

Widget normalText({
  String? text,
  Color? color,
  double? size,
}) {
  return Text(
    text!,
    style: TextStyle(
        fontFamily: "quick_sem1",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold),
  );
}
