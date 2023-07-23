import 'package:books_app/pages/fav_Books_Page.dart';
import 'package:books_app/pages/home.dart';
import 'package:flutter/material.dart';

import 'pages/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData(
      //   textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomePage(),

      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/home': (context) => const HomePage(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/favorites': (context) => const FavBooksPage(),
      // },
      // home: IntroPage(),
    );
  }
}
