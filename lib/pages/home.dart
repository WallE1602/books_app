// ignore: unused_import
import 'package:books_app/pages/add_to_fav.dart';
import 'package:books_app/pages/profile_page.dart';
import 'package:books_app/screens/product/products_screen.dart';
import 'package:books_app/widgets/bottom_Nav_Bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to control bottom navbar
  int _selectedIndex = 0;

  //method to update selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display

  final _pages = [
    //homepage
    ProductsScreen(),

    //fav page
    // FavBooksPage(),
    addtofav(),

    //profile page
    // Profile(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
