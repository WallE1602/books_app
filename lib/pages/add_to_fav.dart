import 'package:books_app/constants.dart';
import 'package:books_app/widgets/fetchBooks.dart';
import 'package:flutter/material.dart';

class addtofav extends StatefulWidget {
  @override
  _addtofavState createState() => _addtofavState();
}

class _addtofavState extends State<addtofav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: fetchData("users-favourites"),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Favourites",
        style: TextStyle(color: kPrimaryColor),
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: const Icon(
        Icons.favorite_border_rounded,
        color: kPrimaryColor,
        size: 30,
      ),
      // IconButton(
      //   padding: EdgeInsets.only(left: kDefaultPadding),
      //   icon: SvgPicture.asset("lib/icons/back.svg"),
      //   onPressed: () {
      //     // Navigator.pop(context);
      //   },
      // ),
      centerTitle: false,
    );
  }
}
