import 'package:books_app/constants.dart';
import 'package:books_app/screens/details/components/product_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  // var _product;
  var products;
  ProductDetails(this.products);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users-favourites");
    return collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
          "book-name": widget.products["book-name"],
          "book-year": widget.products["book-year"],
          "book-author": widget.products["book-author"],
          "book-img": widget.products["book-img"],
        })
        .then((value) => print("Added to favourite"))
        .whenComplete(
          () => Get.snackbar("Success!", "Added to Favourites",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white),
        )
        .catchError((error, stackTrace) {
          Get.snackbar("Error!", "Something went wrong. Try again.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          print(error.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    // var products;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      // return SafeArea(
      // bottom: false,
      // child: SingleChildScrollView(
      body: Column(
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
                  child:
                      // Hero(
                      //   tag: '${widget.products["book-name"]}',
                      //   child: ProductPoster(
                      //     size: size,
                      //     image: widget.products.image,
                      //   ),
                      // ),
                      Hero(
                    tag: '${widget.products["book-name"]}',
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 200,
                      // image is square but we add extra 20 + 20 padding thats why width is 200
                      width: 160,
                      child: Image.network(
                        widget.products["book-img"],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    widget.products["book-name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  widget.products["book-author"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  widget.products["book-year"],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                Text(
                  widget.products["book-genre"],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    widget.products["book-summary"],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          // AddToFav(),

          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              // color: Color(0xFFFCBF1E),
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextButton.icon(
                    onPressed: () => addToFavourite(),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    label: const Text(
                      "Add to Favourites",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
      // ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("lib/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
    );
  }
}
