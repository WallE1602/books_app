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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //book pic
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(book.imagePath)),

          //desc
          Text(
            book.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.indigo,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [Text(book.description), Text(book.year)],
              ),

              //Favorite icon
              Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.black),
                  child: const Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
