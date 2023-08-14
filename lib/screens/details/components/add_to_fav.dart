import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class AddToFav extends StatelessWidget {
  const AddToFav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        // color: Color(0xFFFCBF1E),
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          // SvgPicture.asset(
          //   "lib/icons/chat.svg",
          //   height: 25,
          // ),
          // SizedBox(width: kDefaultPadding / 2),
          // Text(
          //   "Chat",
          //   style: TextStyle(fontSize: 18, color: Colors.white),
          // ),
          // it will cover all available spaces
          // Spacer(),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              label: Text(
                "Add to Favourites",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
