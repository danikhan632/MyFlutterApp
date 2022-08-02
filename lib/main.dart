import 'package:flutter/material.dart';
import './screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _username ="";
  String _password ="";
  String _message="";
  bool move =false;
  void validateAuth(){
    if(_username == "admin " && _password == "password "){
      move=true;
    }

  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          //create a textfield
            TextField(
            decoration: const InputDecoration(
              hintText: "Enter username"
            ),
            onChanged: (text){
              setState(() {
                _username=text;
              });
            },

          ), //username
            TextField(
              decoration: const InputDecoration(
                  hintText: "Enter password"
              ),
              onChanged: (text){
                setState(() {
                  _password=text;
                });
              },

            ),//password
            ElevatedButton(
                onPressed: () {
                  validateAuth();
                  if(move){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  }
                },
                child: Text("Login")
            ) //login button
          ],
        ),
      ),
    );
  }
}
