import 'package:books_app/models/book.dart';
import 'package:flutter/cupertino.dart';

class favorite extends ChangeNotifier {
  //list of books to be liked
  List<Book> bookShop = [
    Book(
        name: 'Dune',
        year: '1965',
        imagePath: 'lib/images/book-1.png',
        description: 'Novel by Frank Herbert'),
  ];

  //list of items in favorite page
  List<Book> userFav = [];

  //get list of books to be liked
  List<Book> getBookList() {
    return userFav;
  }

  //add items to favorites
  void addItemsToFav(Book book) {
    userFav.add(book);
    notifyListeners();
  }

  //removing items
  void removeItemFromFav(Book book) {
    userFav.remove(book);
    notifyListeners();
  }
}
