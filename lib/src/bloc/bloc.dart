import 'dart:async';
import 'package:project101/src/bloc/validator.dart';

class Bloc extends Object with Validator {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  
  //Adding transformed data to stream
  //this comes from [Validator]
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  
  //changed data from source used as onChanged function
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

///global instance of BLOC
///which ever file imports this packages has access to bloc
///and if a class in that file and all its chlideren
///Widgets in Widget Tree
final bloc = Bloc();
