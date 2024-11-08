import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
const kTextStyle = TextStyle(
  fontFamily:"Roboto",
);
const kSecondColor = Color(0xFF9AA641);
const kPrimaryColor = Color(0xFF87dce3);
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