import 'package:flutter/material.dart';
import 'kColorStyle.dart';
final kButtonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(100,40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  backgroundColor:kPrimaryColor,
);