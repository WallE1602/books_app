// ignore: file_names
import 'package:books_app/widgets/fav_nav_bar.dart';
import 'package:books_app/widgets/home_App_Bar.dart';
import 'package:flutter/material.dart';

class FavBooksPage extends StatelessWidget {
  const FavBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavNavbar(),
        Container(
          height: 700,
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          child: const Column(
            children: [
              // FavItemSamples(),
            ],
          ),
        ),
      ],
    );
  }
}
