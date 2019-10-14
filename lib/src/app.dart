import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project101/scoppedmodel/model.dart';
import 'package:project101/src/bloc/loginform_bloc.dart';
import 'package:project101/src/provider/loginc_provider.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: new MainModel(),
      child: MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.46,
                    child: LoginScreenBloc()),
                Align(
                    alignment: Alignment.topCenter,
                    child: FlatButton(
                      child: Text("Login Using Provider "),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginWithProvider()));
                      },
                    ))
              ],
            )),
      ),
    );
  }
}

