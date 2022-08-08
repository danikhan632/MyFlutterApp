import 'dart:async';
import './auth_credientials.dart';
import 'package:firebase_auth/firebase_auth.dart';
// 1
enum AuthFlowStatus { login, signUp,loggedIn, endSession }

// 2
class AuthState {
  static AuthFlowStatus authFlowStatus = AuthFlowStatus.login;

  final FirebaseAuth fauth = FirebaseAuth.instance;
  static UserCredential? cred;

  get auth => fauth;

  void setAuthState(AuthFlowStatus change) {
    authFlowStatus = change;
  }

  AuthFlowStatus getAuthState() {
    return authFlowStatus;
  }

  void setUserCred(UserCredential param) {
    cred = param;
  }

  UserCredential? getUserCred() {
    return cred;
  }
}
// 3
class AuthService {
  // 4
  //final authStateController = StreamController<AuthState>();
  AuthState authState = AuthState();


  void showSignUp() {
    authState.setAuthState(AuthFlowStatus.signUp);
  }

  void showLogin() {
    authState.setAuthState(AuthFlowStatus.login);
  }

// 1
  Future<bool> loginWithCredentials(AuthCredentials credentials) async {

    try {
      final authResult = await authState.auth.signInWithEmailAndPassword(
          email: credentials.username, password: credentials.password);
      print(authResult.runtimeType);
      print(authResult);
      print(authResult.user);
      authState.setUserCred(authResult);
      authState.setAuthState(AuthFlowStatus.loggedIn);
      return true;
    }
    catch (e) {
      print(e);
      return false;
    }
    return true;
  }

// 2
  Future<bool> signUpWithCredentials(SignUpCredentials credentials) async{

    try{
      final authResult = await authState.auth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
    }catch(e){
      print(e); return false;
    }
   return true;
  }

  void logOut() {
    authState.setAuthState(AuthFlowStatus.endSession);
  }
}
