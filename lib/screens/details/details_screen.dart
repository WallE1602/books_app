import 'package:books_app/constants.dart';
// ignore: unused_import
import 'package:books_app/models/new_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(product, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("lib/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
    );
  }
}
