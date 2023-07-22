import 'package:books_app/models/book.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  Book book;
  BookTile({super.key, required this.book});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //book pic
          Image.asset(book.imagePath),

          //
        ],
      ),
    );
  }
}
