import 'package:books_app/constants.dart';
import 'package:books_app/pages/fav_Books_Page.dart';
import 'package:books_app/widgets/bottom_Nav_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../pages/profile_Page.dart';
import 'components/body.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // //to control bottom navbar
  // int _selectedIndex = 0;

  // //method to update selected index
  // void navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // //pages to display
  // List<Widget> _pages = [
  //   //books page
  //   ProductsScreen(),

  //   // ProductsScreen(),

  //   //fav page
  //   FavBooksPage(),

  //   //profile page
  //   ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: Body(),

      // Column(
      //   children: [
      //     Expanded(
      //       child: Body(),
      //     ),
      //     Expanded(
      //       flex: 2,
      //       child: IndexedStack(
      //         index: _selectedIndex, // Your selected index
      //         children: _pages, // List of screens
      //       ),
      //     ),
      //   ],
      // ),

      // bottomNavigationBar: MyBottomNavBar(
      //   onTabChange: (index) => navigateBottomBar(index),
      // ),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     elevation: 0,
  //     centerTitle: false,
  //     title: Text('Dashboard'),
  //     // actions: <Widget>[
  //     //   IconButton(
  //     //     icon: SvgPicture.asset("lib/icons/notification.svg"),
  //     //     onPressed: () {},
  //     //   ),
  //     // ],
  //   );
  // }
}

// class ProductsScreen extends StatelessWidget {
//     final TextEditingController _searchController = TextEditingController();

//   //to control bottom navbar
//   int _selectedIndex = 0;

//   //method to update selected index
//   void navigateBottomBar(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: buildAppBar(),
//       backgroundColor: kPrimaryColor,
//       body: Body(),

//       bottomNavigationBar: MyBottomNavBar(
//         onTabChange: (index) => navigateBottomBar(index),
//       ),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       centerTitle: false,
//       title: Text('Dashboard'),
//       // actions: <Widget>[
//       //   IconButton(
//       //     icon: SvgPicture.asset("lib/icons/notification.svg"),
//       //     onPressed: () {},
//       //   ),
//       // ],
//     );
//   }
// }
