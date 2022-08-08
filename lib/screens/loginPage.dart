import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:yeezus2/route_generate.dart';

import '../components/auth_credientials.dart';
import '../components/auth_service.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? shouldShowSignUp;
  final ValueChanged<LoginCredentials>? didProvideCredentials;

  LoginPage({Key? key, this.didProvideCredentials, this.shouldShowSignUp})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1
  String message = '';
  final _authService = AuthService();
  String _username="";
  String _password="";
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // 2
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(

        child: Container(
          width: 300,
          margin: EdgeInsets.all(20),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome to Workshop App',),
              const Padding(padding: EdgeInsets.all(5)),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  }
              ),
              const Padding(padding: EdgeInsets.all(5)),
              TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  }
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(message),
              const Padding(padding: EdgeInsets.all(1)),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  bool loggedInSuccess = await _authService.loginWithCredentials(LoginCredentials(username: _username, password: _password));
                  print(loggedInSuccess);
                  if(loggedInSuccess){
                    Navigator.pushReplacementNamed(context,"/home" );
                  }
                  else{
                    setState(() {
                      message = 'Username or password is incorrect';
                    });
                  }

                },
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(

                    onPressed: () {
                      _authService.showSignUp();
                    },
                    child: Text('Don\'t have an account? Sign up.'),
                  ))
            ],
          ),
        ),
      ),
    );
  }


  // 7
  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('password: $password');
    final credentials =
    LoginCredentials(username: username, password: password);
    widget.didProvideCredentials!(credentials);


  }
}

