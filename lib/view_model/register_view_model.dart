import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odev_firebase/view/home_page.dart';
import 'package:odev_firebase/view/login_page.dart';
import 'package:odev_firebase/view_model/home_page_view_model.dart';
import 'package:odev_firebase/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void register(BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openMainPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: const HomePage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
