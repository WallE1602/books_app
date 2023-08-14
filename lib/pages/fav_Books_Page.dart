// ignore: file_names
import 'package:books_app/components/search_box.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/models/favitems_samples.dart';
import 'package:books_app/widgets/fav_nav_bar.dart';
import 'package:books_app/widgets/home_App_Bar.dart';
import 'package:flutter/material.dart';

class FavBooksPage extends StatelessWidget {
  const FavBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: FavNavbar(),
          // child: SearchBox(onChanged: (value) {}),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        // FavNavbar(),

        Expanded(
          child: Stack(
            children: <Widget>[
              //background
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Container(
                height: 665,
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: Column(
                  children: [
                    FavItemSamples(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
