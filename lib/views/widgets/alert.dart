import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

  class kAlert extends StatelessWidget {
  const kAlert({
    super.key, 
    required this.title,
    required this.buildContext,
    required this.message, 
    this.yesCallback = null, 
    this.noCallback = null, 
    this.noText = "No", 
    this.yesText = "Yes",
});
  final BuildContext buildContext;
  final String title;
  final String message;
  final String noText;
  final String yesText;
  final VoidCallback? yesCallback;
  final VoidCallback? noCallback;
  AlertDialog isAndroid(){
    return AlertDialog(
      title: Text(this.title),
      content:Text(this.message),
      actions:[
        if(noCallback!= null)
        TextButton(
          onPressed: this.noCallback,
          child: Text(this.noText),
        ),
        yesCallback!=null?
        TextButton(
          onPressed: this.yesCallback,
          child: Text(this.yesText),
        ):TextButton(
          onPressed: (){
            Navigator.of(buildContext).pop();},
          child: Text(this.yesText),
        ),
      ]
    );
  }
  CupertinoAlertDialog isIOS(){
    return CupertinoAlertDialog(
      title: Text(this.title),
      content: Text(this.message),
      actions:<CupertinoDialogAction>[
        if(noCallback!= null)
        CupertinoDialogAction(
          onPressed: this.noCallback,
          isDestructiveAction: true,
          child: Text(this.noText),
        ),
        yesCallback!=null?
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: this.yesCallback,
          child: Text(this.yesText),
        ):CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: (){Navigator.of(buildContext).pop();},
          child: Text(this.yesText),
        ),
      ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS?isIOS():isAndroid();
  }
}