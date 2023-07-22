import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
            child: Text(
              'Boooks',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.redAccent,
              padding: EdgeInsets.all(7),
            ),
            badgeContent: Text(
              '2',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 30,
                color: Colors.black,
              ),
            )
          ),
        ],
      ),

    );
  }
}
