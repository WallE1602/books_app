import 'package:books_app/pages/booksPage.dart';
import 'package:books_app/pages/profilePage.dart';
import 'package:books_app/widgets/bottomNavBar.dart';
import 'package:books_app/widgets/homeAppBar.dart';
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
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    }
    );
  }

  //pages to display
  final List<Widget> _pages = [
    //books page
    const BooksPage(),

    //profile page
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:
      ListView(
        children: [
          HomeAppBar(),
          _pages[_selectedIndex],
        ],
      ),

      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}