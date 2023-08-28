import 'package:books_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../pages/add_to_fav.dart';
import 'product_image.dart';

class Body extends StatefulWidget {
  // const Body({super.key});
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var products;
  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users-favourites");
    return collectionRef.doc(currentUser!.email).collection("items").doc().set({
      "book-name": products["book-name"],
      "book-year": products["book-year"],
      "book-author": products["book-author"],
      "books-img": products["books-img"],
    }).then((value) => print("Added to favourites"));
  }

  @override
  Widget build(BuildContext context) {
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
                  tag: '${products["book-name"]}',
                  child: ProductPoster(
                    size: size,
                    image: products.image,
                  ),
                ),
                //     Hero(
                //   tag: products["book-name"],
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                //     height: 160,
                //     // image is square but we add extra 20 + 20 padding thats why width is 200
                //     width: 150,
                //     child: ProductPoster(
                //       size: size,
                //       image: products.image,
                //     ),

                //     // Image.asset(
                //     //   product.image,
                //     //   fit: BoxFit.cover,
                //     // ),
                //   ),
                // ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  products["book-name"],
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                products["book-author"],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                products["book-year"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  products["book-summary"],
                  style: TextStyle(color: kTextLightColor),
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
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            // color: Color(0xFFFCBF1E),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              // SvgPicture.asset(
              //   "lib/icons/chat.svg",
              //   height: 25,
              // ),
              // SizedBox(width: kDefaultPadding / 2),
              // Text(
              //   "Chat",
              //   style: TextStyle(fontSize: 18, color: Colors.white),
              // ),
              // it will cover all available spaces
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton.icon(
                  onPressed: () => addToFavourite(),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 35.0),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  label: const Text(
                    "Add to Favourites",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      // ),
      // ),
    );
  }
}

// class Body extends StatelessWidget {
//   final Product product;

//   const Body({Key? key, required this.product}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // it provide us total height and width
//     Size size = MediaQuery.of(context).size;
//     // it enable scrolling on small devices
//     return Column(
//       // return SafeArea(
//       // bottom: false,
//       // child: SingleChildScrollView(
//       // child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           decoration: BoxDecoration(
//             color: kBackgroundColor,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(50),
//               bottomRight: Radius.circular(50),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Center(
//                 child: Hero(
//                   tag: '${product.id}',
//                   child: ProductPoster(
//                     size: size,
//                     image: product.image,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//                 child: Text(
//                   product.title,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Text(
//                 '${product.author}',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   color: kPrimaryColor,
//                 ),
//               ),
//               Text(
//                 '${product.year}',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: kSecondaryColor,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//                 child: Text(
//                   product.description,
//                   style: TextStyle(color: kTextLightColor),
//                 ),
//               ),
//               SizedBox(height: kDefaultPadding),
//             ],
//           ),
//         ),
//         AddToFav(),
//       ],
//       // ),
//       // ),
//     );
//   }
// }
