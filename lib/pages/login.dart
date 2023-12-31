import 'package:books_app/pages/home.dart';
import 'package:books_app/pages/reg_page.dart';
import 'package:books_app/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:books_app/widgets/header_widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign in into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              reusableTextField(
                                  "Enter Email ID",
                                  Icons.mail_outline_rounded,
                                  false,
                                  emailTextController),
                              SizedBox(height: 20.0),
                              reusableTextField(
                                  "Enter Password",
                                  Icons.lock_outline,
                                  true,
                                  passwordTextController),
                              SizedBox(height: 20.0),
                              firebaseUIButton(context, "Sign In", () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailTextController.text,
                                        password: passwordTextController.text)
                                    .then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    })
                                    .whenComplete(
                                      () => Get.snackbar(
                                          "Welcome!", "You are logged in.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              Colors.indigo.withOpacity(0.8),
                                          colorText: Colors.white),
                                    )
                                    .catchError((error, stackTrace) {
                                      Get.snackbar("Error!",
                                          "Something went wrong. Try again.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              Colors.redAccent.withOpacity(0.1),
                                          colorText: Colors.red);
                                      print(error.toString());
                                    });
                                // .onError((error, stackTrace) {
                                //   print("Error ${error.toString()}");
                                // });
                              }),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
