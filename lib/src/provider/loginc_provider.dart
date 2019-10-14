import 'package:flutter/material.dart';
import 'package:project101/src/provider/providerhelper.dart';
import 'package:provider/provider.dart';

class LoginWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ProviderHelper(),
      child: Scaffold(body: Center(child: LoginUI())),
    );
  }
}

class LoginUI extends StatelessWidget {
  Widget emailTextfield(ProviderHelper provider,
      {Function(String value) onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "name@example.com",
        labelText: "Email",
        errorText: provider.isEmailError ? provider.emailErrorText : "",
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordFlied(ProviderHelper provider,
      {Function(String value) onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Enter the Password",
        labelText: "Password",
        errorText: provider.ispasswordError ? provider.passwordErrorText : "",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProviderHelper provider = Provider.of<ProviderHelper>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.46,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          emailTextfield(provider, onChanged: provider.emailValidator),
          passwordFlied(provider, onChanged: provider.passwordValidator),
          AbsorbPointer(
            absorbing: !provider.isSubmit(),
            child: Opacity(
              opacity: provider.isSubmit() ? 1.0 : 0.34,
              child: RaisedButton(
                color: Colors.blue,
                child: Text("Login"),
                onPressed: () {
                  // print(provider.getsubmitButtonbool());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
