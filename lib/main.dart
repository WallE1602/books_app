import 'package:books_app/models/favorite_item.dart';
import 'package:books_app/pages/fav_Books_Page.dart';
import 'package:books_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,

    //   home: HomePage(),

    //   // initialRoute: '/',
    //   // routes: {
    //   //   // When navigating to the "/" route, build the FirstScreen widget.
    //   //   '/home': (context) => const HomePage(),
    //   //   // When navigating to the "/second" route, build the SecondScreen widget.
    //   //   '/favorites': (context) => const FavBooksPage(),
    //   // },
    //   // home: IntroPage(),
    // );

    return ChangeNotifierProvider(
      create: (context) => favorite(),
      builder: ((context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
          )),
    );
  }
}
