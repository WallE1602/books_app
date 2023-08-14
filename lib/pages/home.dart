import 'package:books_app/pages/fav_Books_Page.dart';
import 'package:books_app/pages/profile_Page.dart';
import 'package:books_app/screens/product/products_screen.dart';
import 'package:books_app/widgets/bottom_Nav_Bar.dart';
import 'package:books_app/widgets/home_App_Bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

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
    FavBooksPage(),

    //profile page
    ProfilePage(),
  ];
  // List<Widget> _pages = [
  //   //books page
  //   // BooksPage(),
  //   ProductsScreen(),

  //   //fav page
  //   FavBooksPage(),

  //   //profile page
  //   ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
