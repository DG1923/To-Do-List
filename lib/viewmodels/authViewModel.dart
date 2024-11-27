import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/viewmodels/authViewModel/email_auth_view_model.dart';
import 'package:to_do_list/viewmodels/authViewModel/google_auth_view_model.dart';

class AuthViewModel  extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;
  /*
  _user?.providerData.first.providerId
  It will check method user use to login 
  */
  bool get isGoogleSignIn => _user?.providerData.first.providerId=="google.com";
  String get userName =>_user?.displayName??"Khong co";
  String get userEmail =>_user!.email??"khong co";
  AuthViewModel(){
    _init();
  }
  void _init(){
    //listen event when user is signed in or signed out
    _auth.authStateChanges().listen((User? user){
      _user = user;
      notifyListeners();
    });
  }
  Future<void> signOut() async{
    if(isGoogleSignIn){
      final bool isSignedOut = await GoogleAuthViewModel().signOut();
      if(isSignedOut){
        _user = null;
        notifyListeners();
      } 
    }else{
      final bool isSignedOut = await EmailAuthViewModel().signOut();
      if(isSignedOut){
        _user = null;
        notifyListeners();
      }
    }
  }
  Map<String,dynamic> getUserInfo(){
    return {
      "User Name":userName,
      "User Email":userEmail,
    };
  }


}
