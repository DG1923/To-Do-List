import 'package:flutter/material.dart';

import '../../../widgets/constants.dart';
class Categoriestab extends StatelessWidget {
  Categoriestab({super.key,required this.sectionTask});
  late List<String> sectionTask;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 24,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:
          sectionTask.map((String title){
            return Container(
                margin: EdgeInsets.only(right: 10.0),
                child: _categoriestab(true,title));
          }).toList(),
        ),
      ),
    );
  }
  Widget _categoriestab(bool isActive,String tittle){
    Color activeColor = Colors.lightBlueAccent;
    Color inactiveColor = Colors.white;
    Color activeTextColor = Colors.white;
    Color inactiveTextColor = Colors.black;
    return ElevatedButton(
        onPressed: (){
          print("$tittle was touched !");
        },
        child: Text(tittle,
            style: kTextStyle.copyWith(
                color: isActive?activeTextColor:inactiveTextColor,
                fontWeight: FontWeight.bold
            )
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),
        )
    );
  }
}

