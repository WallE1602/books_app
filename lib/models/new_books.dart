import 'package:flutter/material.dart';

class Product {
  final String image, title, author, description;
  final int year, id;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.year,
    required this.description,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Dune",
    author: "Frank Herbert",
    year: 1965,
    description: dummyText,
    image: "lib/images/1.png",
  ),
  Product(
    id: 2,
    title: "Crown Jewel",
    author: "Christopher Reich",
    year: 2019,
    description: dummyText,
    image: "lib/images/2.png",
  ),
  Product(
    id: 3,
    title: "The Call of the Wild",
    author: "Jack London",
    year: 1903,
    description: dummyText,
    image: "lib/images/3.png",
  ),
  Product(
    id: 4,
    title: "Harry Potter",
    author: "J.K. Rowling",
    year: 2017,
    description: dummyText,
    image: "lib/images/4.png",
  ),
  Product(
    id: 5,
    title: "Inferno",
    author: "Dan Brown",
    year: 2013,
    description: dummyText,
    image: "lib/images/5.png",
  ),
  Product(
    id: 6,
    title: "Kafka on the Shore",
    author: "Haruki Murakami",
    year: 2002,
    description: dummyText,
    image: "lib/images/6.png",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
