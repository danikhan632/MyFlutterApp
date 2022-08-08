import 'package:flutter/material.dart';
import 'package:yeezus2/components/auth_credientials.dart';
import 'package:yeezus2/route_generate.dart';
import './screens/gps_page.dart';
import './screens/loginPage.dart';
import './screens/signUp.dart';
import './components/auth_service.dart';


import 'dart:core';

import 'package:cloud_functions/cloud_functions.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}