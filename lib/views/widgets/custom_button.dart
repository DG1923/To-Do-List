import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';

class kCustomButton extends StatelessWidget {
  const kCustomButton({super.key, required this.function, required this.text, this.width = double.infinity, this.color = kPrimaryColor});
  final Function function;
  final String text;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: width,
          child: MaterialButton(
            minWidth: 200,
            color: color,
            splashColor: color.withOpacity(0.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  width: 0,
                  color: color,
                )),
            onPressed: () {
              function();
            },
            child: Text(
              text,
              style: kTextStyle.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ));
  }
}