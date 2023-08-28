import 'package:books_app/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:books_app/widgets/header_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:books_app/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  // final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController profController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // bool _obscureText = true;

  signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => LoginPage()));
        //     .whenComplete(
        //   () => Get.snackbar("Hurrah!", "User Authenticated",
        //       snackPosition: SnackPosition.BOTTOM,
        //       backgroundColor: Colors.green.withOpacity(0.8),
        //       colorText: Colors.white),
        // )
        //     .catchError((error, stackTrace) {
        //   Get.snackbar("Error!", "Something went wrong. Try again.",
        //       snackPosition: SnackPosition.BOTTOM,
        //       backgroundColor: Colors.redAccent.withOpacity(0.1),
        //       colorText: Colors.red);
        //   print(error.toString());
        // });
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      //nothing needed
    }
  }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef
        .doc()
        .set({
          "username": usernameController.text,
          "phone": phoneController.text,
          "profession": profController.text,
          "email": emailController.text,
          "password": passwordController.text,
        })
        .then((value) => print("user added to db."))
        .catchError((error) => print("something wrong. $error"))
        .whenComplete(
          () => Get.snackbar("Success!", "Registration Complete!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white),
        );
  }

  // sendUserDataToDB() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentUser = _auth.currentUser;

  //   CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection("users");
  //   return _collectionRef.doc(currentUser!.email).set({
  //     "user_name": userNameTextController.text,
  //     "profession": profController.text,
  //     "phone": phoneController.text,
  //     "e-mail": emailTextController.text,
  //     // "password": passwordTextController.text,
  //   }).then((value) {
  //     Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => LoginPage()))
  //         .whenComplete(
  //       () => Get.snackbar("Success!", "Registration Complete!",
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.green.withOpacity(0.8),
  //           colorText: Colors.white),
  //     );
  //   });
  // }

  // sendUserDataToDB() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentUser = _auth.currentUser;

  //   if (currentUser != null) {
  //     CollectionReference _collectionRef =
  //         FirebaseFirestore.instance.collection("users");

  //     try {
  //       await _collectionRef.doc(currentUser.email).set({
  //         "user_name": userNameTextController.text,
  //         "profession": profController.text,
  //         "phone": phoneController.text,
  //         "e-mail": emailTextController.text,
  //       });

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginPage()),
  //       );
  //       // .whenComplete(() {
  //       //   Get.snackbar(
  //       //     "Success!",
  //       //     "Registration Complete!",
  //       //     snackPosition: SnackPosition.BOTTOM,
  //       //     backgroundColor: Colors.green.withOpacity(0.8),
  //       //     colorText: Colors.white,
  //       //   );
  //       // });
  //     } catch (error) {
  //       Get.snackbar(
  //         "Error!",
  //         "Something went wrong. Try again.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red,
  //       );
  //       print(error.toString());
  //     }
  //   } else {
  //     print("Not Working");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        reusableTextField("Enter User Name",
                            Icons.person_outline, false, usernameController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter your profession",
                            Icons.badge_outlined, false, profController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter your phone number",
                            Icons.phone_android_rounded,
                            false,
                            phoneController),
                        SizedBox(
                          height: 20.0,
                        ),
                        reusableTextField("Enter Email",
                            Icons.mail_outline_rounded, false, emailController),
                        SizedBox(height: 20.0),
                        reusableTextField("Enter Password", Icons.lock_outlined,
                            true, passwordController),
                        SizedBox(height: 20.0),
                        firebaseUIButton(context, "Save To DB", () {
                          // signUp();
                          sendUserDataToDB();
                        }),
                        SizedBox(height: 10.0),
                        firebaseUIButton(context, "Sign Up", () {
                          signUp();
                          // sendUserDataToDB();
                        }),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
