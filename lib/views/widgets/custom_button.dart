import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'styles/kButtonStyle.dart';
class kCustomButton extends StatelessWidget {
  const kCustomButton({super.key, required this.function, required this.text, this.width = double.infinity, this.color = kPrimaryColor});
  final Function function;
  final String text;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: kButtonPrimary,
      child: Text(
        text,
        style: kTextStyle.copyWith(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}