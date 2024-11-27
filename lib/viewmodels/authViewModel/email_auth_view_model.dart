import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class EmailAuthViewModel extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  void _startLoading(){
    _isLoading = true;
    notifyListeners();
  }
  void _stopLoading(){
    _isLoading = false;
    notifyListeners();
  }
  void _setErrorMessage(String message){
    _errorMessage = message;
    _stopLoading();
  }
  Future<bool> signInWithEmail(String email, String password)async{
    _startLoading();
    if(email.isEmpty || password.isEmpty){
      _setErrorMessage("Email or password is empty");
      return false;
    }else{
      try{
        final UserCredential credentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(credentials.user!=null){
          _stopLoading();
          notifyListeners();
          return true;
        }
      } on FirebaseAuthException catch(e){
        _setErrorMessage(e.message.toString()+" "+e.code);
        return false; 
      } catch(e){
        _setErrorMessage(e.toString());
        return false;
      }
    }
    return false;
  }
  Future<bool> signUpWithEmail(String email, String password, String name)async{
    _startLoading();
    if(email.isEmpty || password.isEmpty){
      _setErrorMessage("Email or password is empty");
      return false;
    }else{
      try{
        final UserCredential credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(credentials.user!=null){
          _stopLoading();
          await credentials.user?.updateDisplayName(name);
          notifyListeners();
          return true;
        }
      }on FirebaseAuthException catch(e){
        _setErrorMessage(e.message.toString()+" "+e.code);
        return false;
      }catch(e){
        _setErrorMessage(e.toString());
        return false;
      }
    }
    return false;
  }
  Future<bool> signOut()async{
    _startLoading();
    try{
      await _auth.signOut();
      _stopLoading();
    }on FirebaseAuthException catch(e){
      _setErrorMessage("Email sign out failed : ${e.message!} and code : ${e.code}");
      return false;
    }catch(e){
      _setErrorMessage("Failed to sign out with Email : ${e.toString()}");
      return false;
    }
    return true;
  }
}
