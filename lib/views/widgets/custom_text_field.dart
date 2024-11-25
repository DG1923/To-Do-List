import 'package:flutter/material.dart';
import 'constants.dart';
class kCustomTextField extends StatelessWidget {
  const kCustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0,10),
            )
          ]
      ),
      child: TextFormField(
        obscureText: false,
        keyboardType:TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "xin choa",
          prefixIcon: Icon(Icons.access_alarm_sharp,color: kPrimaryColor,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.grey[50],
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
