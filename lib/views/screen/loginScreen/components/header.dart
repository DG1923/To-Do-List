import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:to_do_list/views/widgets/custom_image.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const kCustomImage(
            imagePath: 'assets/image/photo.png', width: 200, height: 200),
        const SizedBox(height: 15),
        Text(
          "Login",
          style: kTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
