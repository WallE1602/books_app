import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.indigo,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 8,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home_rounded,
            text: 'HOME',
          ),
          GButton(
            icon: Icons.favorite_rounded,
            text: 'Favorites',
          ),
          GButton(
            icon: Icons.account_circle_rounded,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
