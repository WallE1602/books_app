import 'package:books_app/components/search_box.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/pages/books_details.dart';
import 'package:books_app/screens/details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'category_list.dart';
import 'product_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedCategory = 'All'; // Default category

  List products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("books").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        products.add({
          "book-name": qn.docs[i]["book-name"],
          "book-summary": qn.docs[i]["book-summary"],
          "book-year": qn.docs[i]["book-year"],
          "book-genre": qn.docs[i]["book-genre"],
          "book-author": qn.docs[i]["book-author"],
          "book-img": qn.docs[i]["book-img"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SearchBox(onChanged: (value) {}),
        ),
        CategoryList(),
        const SizedBox(height: kDefaultPadding / 2),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    products: products[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(products[index]),
                        ),
                      );
                    },
                  ),
                  // ElevatedButton(
                  //   onPressed: () => print(products),
                  //   child: Text("Print products")),
                ),
              )
            ],
          ),
        ),
      ],
      // ),
    );
  }
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return SafeArea(
//     return Column(
//       // bottom: false,
//       // child: Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: SearchBox(onChanged: (value) {}),
//         ),
//         CategoryList(),
//         SizedBox(height: kDefaultPadding / 2),
//         Expanded(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: 30),
//                 decoration: BoxDecoration(
//                   color: kBackgroundColor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Container(
//                   child: ListView.builder(
//                     // here we use our demo products list
//                     itemCount: products.length,
//                     itemBuilder: (context, index) => ProductCard(
//                       itemIndex: index,
//                       product: products[index],
//                       press: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailsScreen(
//                               product: products[index],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//       // ),
//     );
//   }
// }
