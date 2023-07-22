// import 'package:books_app/pages/booksPage.dart';
// import 'package:books_app/pages/profilePage.dart';
// import 'package:books_app/widgets/bottomNavBar.dart';
// import 'package:books_app/widgets/homeAppBar.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   //to control bottom navbar
//   int _selectedIndex = 0;
//
//   //method to update selected index
//   void navigateBottomBar(int Index){
//     setState(() {
//       _selectedIndex = index;
//     }
//     );
//   }
//
//   //pages to display
//   final List<Widget> _pages = [
//     //books page
//     const BooksPage(),
//
//     //profile page
//     const ProfilePage(),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           HomeAppBar(),
//         ],
//       ),
//       bottomNavigationBar: MyBottomNavBar(
//         onTabChange: (index) => navigateBottomBar(index),
//       ),
//     );
//   }
// }
