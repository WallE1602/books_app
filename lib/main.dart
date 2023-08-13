import 'package:books_app/models/favorite_item.dart';
import 'package:books_app/pages/fav_Books_Page.dart';
import 'package:books_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => favorite(),
      builder: ((context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
          )),
    );
  }
}
