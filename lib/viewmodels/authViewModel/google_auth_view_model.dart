import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void _setErrorMessage(String message) {
    _errorMessage = message;
    _stopLoading();
  }

  Future<bool> signInWithGoogle() async {
    _startLoading();
    try {
      //Sign in with google account first
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      //Check if user is signed in but not select google account
      if (googleUser == null) {
        _setErrorMessage('Failed to sign in with Google');
        return false;
      }
      //Authenicate the user with google account 
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      //Sign in with firebase
      final UserCredential user = await _auth.signInWithCredential(credentials);
      if (user.user!= null) {
        _stopLoading();
        return true;
      }

    } on FirebaseAuthException catch (e) {
      _setErrorMessage(
          "Google sign in failed : ${e.message!} and code : ${e.code}");
      return false;
    } catch (e) {
      _setErrorMessage("Failed to sign in with Google : ${e.toString()}");
      return false;
    }

    return false;
  }

  Future<bool> signOut() async {
   _startLoading();
   try{
    await _auth.signOut();
    await _googleSignIn.signOut();
    _stopLoading();
   }on FirebaseAuthException catch (e) {  
    _setErrorMessage("Google sign out failed : ${e.message!} and code : ${e.code}");
    return false; 
   } catch (e) {
    _setErrorMessage("Failed to sign out with Google : ${e.toString()}");   
    return false;
   }
    return false;
  }
}
