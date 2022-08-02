import 'package:flutter/material.dart';
import './screens/gps_page.dart';
import './screens/loginPage.dart';
import './screens/signUp.dart';
import './components/auth_service.dart';
import './screens/verification_page.dart';
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
  final _authService = AuthService();
  @override
  void initState() {
    super.initState();
    _authService.showLogin();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop App',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: StreamBuilder<AuthState>(
      stream: _authService.authStateController.stream,
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Navigator(
          pages: [

            if (snapshot.data!.authFlowStatus == AuthFlowStatus.login)
              MaterialPage(
                  child: LoginPage(
                      didProvideCredentials: _authService.loginWithCredentials,
                      shouldShowSignUp: _authService.showSignUp)),
            if (snapshot.data!.authFlowStatus == AuthFlowStatus.signUp)
              MaterialPage(
                  child: SignUpPage(
                      didProvideCredentials: _authService.signUpWithCredentials,
                      shouldShowLogin: _authService.showLogin)),

            if (snapshot.data!.authFlowStatus == AuthFlowStatus.verification)
              MaterialPage(child: VerificationPage(
                  didProvideVerificationCode: _authService.verifyCode)),

            if (snapshot.data!.authFlowStatus == AuthFlowStatus.session)
              MaterialPage(
                  child: GpsPage(shouldLogOut: _authService.logOut))
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      } else {
        // 6
        return Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      }
    }),
    );
  }
}
