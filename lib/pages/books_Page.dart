import 'package:books_app/models/book.dart';
import 'package:books_app/widgets/book_tile.dart';
import 'package:books_app/widgets/categories_Widget.dart';
import 'package:books_app/widgets/home_App_Bar.dart';
import 'package:books_app/widgets/item_Widget.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        //search bar
        Container(
          padding: const EdgeInsets.only(top: 15),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Search"),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),

        // Container(
        //   padding: const EdgeInsets.only(top: 20),
        // ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: const [
        //       Text(
        //         "Books for you",
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 24,
        //           color: Colors.indigo,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        //Categories
        // Padding(
        //   padding : const EdgeInsets.symmetric(horizontal: 20),
        //   child: Container(
        //     alignment: Alignment.centerLeft,
        //     margin: EdgeInsets.symmetric(
        //       vertical: 20,
        //       horizontal: 20,
        //     ),
        //     child: Text(
        //       "Categories",
        //       style: TextStyle(
        //         fontSize: 25,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.indigo,
        //       ),
        //     ),
        //   ),

        // ),

        //Categories widget
        // CategoriesWidget(),

        //items
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            'Books for you',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ),

        //items widget
        ItemsWidget(),

        const SizedBox(height: 10),

        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 6,
        //     itemBuilder: (context, index) {
        //       Book book = Book(
        //           name: 'Book 1',
        //           year: "2023",
        //           imagePath: 'lib/images/book-1.png',
        //           description: "Created by Frank Hubert");
        //       return BookTile(
        //         book: book,
        //       );
        //     },
        //   ),
        // ),

        // const Padding(
        //   padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
        //   child: divide(first, second),
        // ),
      ],
    );
  }
}
