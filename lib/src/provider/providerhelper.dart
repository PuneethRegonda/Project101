import 'package:flutter/material.dart';

class ProviderHelper with ChangeNotifier{

  bool isEmailError= false;
  bool ispasswordError= false;


  String _emailErrorText ="";
  String _passwordErrorText = "";
  
  String get emailErrorText =>_emailErrorText;
  String get passwordErrorText =>_passwordErrorText;

  void Function(String) get emailValidator => (String email){
    if(email.contains("@")){
      _emailErrorText="";
      isEmailError = false;
    }
    else{
      isEmailError = true;
      _emailErrorText ="Enter valid email";
    }
    notifyListeners();
  };
  void Function(String) get passwordValidator => (String password){
if(password.length>=6){
      ispasswordError = false;
      _passwordErrorText="";
    }
    else{
      ispasswordError=true;
      _passwordErrorText ="Weak Password";
    }
    notifyListeners();
  };

  bool Function() get isSubmit=> (){
    if(isEmailError||ispasswordError){
      return false;
    }
    else{
      return true;
    }
  };
}

