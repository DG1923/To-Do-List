import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            height: 60,
            minWidth: 60,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              'assets/icon/google.png',
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            height: 60,
            minWidth: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              'assets/icon/apple.png',
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ]);
  }
}
