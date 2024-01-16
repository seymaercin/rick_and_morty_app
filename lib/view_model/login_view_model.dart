import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odev_firebase/view/home_page.dart';
import 'package:odev_firebase/view/register_page.dart';
import 'package:odev_firebase/view_model/home_page_view_model.dart';
import 'package:odev_firebase/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openHomePage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openHomePage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: const HomePage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
