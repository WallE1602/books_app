import 'package:books_app/constants.dart';
import 'package:books_app/models/new_books.dart';
import 'package:flutter/material.dart';

import 'add_to_fav.dart';
import 'product_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return Column(
      // return SafeArea(
      // bottom: false,
      // child: SingleChildScrollView(
      // child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: '${product.id}',
                  child: ProductPoster(
                    size: size,
                    image: product.image,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                '${product.author}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                '${product.year}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.description,
                  style: TextStyle(color: kTextLightColor),
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        AddToFav(),
      ],
      // ),
      // ),
    );
  }
}
