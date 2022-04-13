import 'package:calculator/fixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class NumberButton extends StatelessWidget {
  NumberButton(
      {Key? key,
      required this.bodytext,
      required this.color,
      required this.function})
      : super(key: key);
  String bodytext;
  Color color;
  Function function;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          bodytext,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
      )),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      width: 63,
      height: 63,
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({Key? key, required this.bodytext, required this.function})
      : super(key: key);
  String bodytext;

  Function function;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          bodytext,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
      )),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(25)),
      width: 63,
      height: 63,
    );
  }
}
