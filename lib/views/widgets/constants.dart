import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kTextStyle = TextStyle(
  fontFamily:"Roboto",
  color: kSecondColor,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const kSecondColor = Colors.white;
// const kPrimaryColor = Color(0xFF87dce3);
const kPrimaryColor = Colors.lightBlueAccent;

const kTextFieldDecoration = InputDecoration(
  hintText: "Type here........",
  contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide:BorderSide(color: kPrimaryColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  focusColor: kPrimaryColor,
);
class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.lineTo(0, h - 50); // Bắt đầu từ góc dưới bên trái
    path.quadraticBezierTo(w / 2, h-10, w,
        h - 50); //Đường cong với x1y1 = (w/2,h+50) với x2y2 = w,h-100
    path.lineTo(w, 0); // Nối đến góc trên bên phải
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}