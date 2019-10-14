/// @Puneeth Regonda (Loves Flutter)
/// this is implemetation of the BLOC using
/// global Instance of Bloc
///
/// Actions I performed is
/// 1. Used Bloc for User Input email, password
/// 2. I thought of making the use of Rxdart for handling both Streams of email and Password validators are done then I used the
///    Scoped Model for notifying the Button functionality to work
/// This Project is to exhibt my familiarity with BLOC and ScoppedModel
///

import 'package:flutter/material.dart';
import 'package:project101/scoppedmodel/model.dart';
import 'package:project101/src/bloc/bloc.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreenBloc extends StatelessWidget {
  Widget emailTextField(MainModel model) {
    return StreamBuilder(
      stream: bloc.email.asBroadcastStream(),
      builder: (BuildContext context, snapshot) {
        return TextField(
            onChanged: (String value) {
              print("Hello email $value");
              if (value.contains("@")) {
                model.toogleemail(true);
              } else {
                model.toogleemail(false);
              }
              bloc.emailChanged(value);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'name@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
            ));
      },
    );
  }

  Widget passwordTextFiled(MainModel model) {
    return StreamBuilder(
      stream: bloc.password.asBroadcastStream(),
      builder: (BuildContext context, snapshot) {
        return TextField(
          onChanged: (String value) {
            if (value.length >=6) {
              model.tooglepassword(true);
            } else {
              model.tooglepassword(false);
            }
            bloc.passwordChanged(value);
          },
          decoration: InputDecoration(
            hintText: 'Enter the Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitbutton(MainModel model) {
    return AbsorbPointer(
      absorbing: !model.isvalidSubmission,
      child: Opacity(
        opacity: model.isvalidSubmission ? 1.0 : 0.34,
        child: RaisedButton(
          color: Colors.blue,
          child: Text("Login"),
          onPressed: () {
            print(model.isvalidSubmission);
            print(model.listenerCount);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget widget, MainModel model) {
        return Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            emailTextField(model),
            passwordTextFiled(model),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: submitbutton(model),
            )
          ],
        );
      },
    );
  }
}
