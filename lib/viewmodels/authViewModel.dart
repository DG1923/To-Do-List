import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do_list/views/widgets/alert.dart';
class Authviewmodel extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  User? _user;
  User? get user => _user;
  User? get getCurrentUser => _auth.currentUser;
  Authviewmodel(){
    _auth.setLanguageCode('en');
  }
  Future<bool> signInWithEmail(BuildContext context,String email, String password) async{
    try{
      _isLoading = true;
      notifyListeners();
      print("email ${email} password ${password}");
      UserCredential credentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(credentials.user!= null){
        _isLoading = false;
        kAlert(buildContext: context,title: "Success",message: "Sign in successful");
        notifyListeners();
        _user = credentials.user;
        return true;
      }
      _errorMessage = "Sign in failed";
      return false;

    }on FirebaseAuthException catch(e){
      print('Failed with error code eeeee : ${e.code}');
  print(e.message);
        return false;
    }
    catch(e){
      print(e);
      _errorMessage = e.toString();

      return false;
    }
  }
  Future<bool> signUpWithEmail(BuildContext context,String emailAddress, String password) async{
    try{
      _isLoading = true;
      notifyListeners();
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(email: emailAddress, password: password);
      if(credentials.user!= null){
        _isLoading = false;
        kAlert(buildContext: context,title: "Success",message: "Sign up successful");
        notifyListeners();
        _user = credentials.user;
        return true;
      }
      _errorMessage = "Sign up failed";
      return false;

    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){  
        _errorMessage = 'The password provided is too weak.';
      }else if(e.code == 'email-already-in-use'){
        _errorMessage = 'The account already exists for that email.';
      }
      return false;
    }
    catch(e){
      print(e);
      _errorMessage = e.toString();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async{
    try{
      //Set loading to true 
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      //Check if user is already signed in
      _user = getCurrentUser;
      if(_user != null){
        return true;
      }else{
        //Sign in with google
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if(googleUser == null){
          _isLoading = false;
          _errorMessage = 'Sign in with Google failed';
          notifyListeners();
          return false;
        }
        //Authenticate 
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
        );
        //Sign in with firebase
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        
        _isLoading = false;
        _user = userCredential.user;
        notifyListeners();
        return _user != null;
      }
    }catch(e){
      _isLoading = false;
      _errorMessage = 'Sign in with Google failed';
      notifyListeners();
      print("Error Sign in with Google : "+e.toString());
      return false;

    }
  }
  Future<void> signOut() async{
    try{
      await Future.wait([_auth.signOut(),_googleSignIn.signOut()]);
      _user = null;
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
    }catch(e){
      _isLoading = false;
      _errorMessage = 'Sign out failed';
      notifyListeners();
      print("Error Sign out : "+e.toString());
    }
  }
}