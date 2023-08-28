import 'package:books_app/constants.dart';
import 'package:books_app/pages/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // // Check if there's an active user session
    // User? currentUser = FirebaseAuth.instance.currentUser;

    // // If a user is logged in, sign them out
    // if (currentUser != null) {
    //   FirebaseAuth.instance.signOut();
    //   // You can also perform any other necessary cleanup or actions here
    // }
    return GetMaterialApp(
      // ChangeNotifierProvider(
      //   create: (context) => favorite(),
      //   builder: ((context, child) => MaterialApp(
      theme: ThemeData(
        // We set Poppins as our default font
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        hintColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      // )),
    );
  }
}
