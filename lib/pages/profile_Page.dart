import 'package:books_app/constants.dart';
import 'package:books_app/pages/login.dart';
import 'package:books_app/pages/myProfile.dart';
import 'package:books_app/widgets/fetchBooks.dart';
import 'package:books_app/widgets/fetchUser.dart';
import 'package:books_app/widgets/reusable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController? userNameTextController;
  TextEditingController? phoneController;
  TextEditingController? profController;

  // setDataToTextField(data) {
  //   return Column(
  //       children: [
  //         TextFormField(
  //           controller: userNameTextController =
  //               TextEditingController(text: data['username']),
  //         ),
  //         TextFormField(
  //           controller: phoneController =
  //               TextEditingController(text: data['phone']),
  //         ),
  //         TextFormField(
  //           controller: profController =
  //               TextEditingController(text: data['profession']),
  //         ),
  //         ElevatedButton(onPressed: () => updateData(), child: Text("Update"))
  //       ],

  //       children: [
  //         reusableTextField(
  //             "Change User Name",
  //             Icons.person_outline,
  //             false,
  //             userNameTextController =
  //                 TextEditingController(text: data["username"])),
  //         reusableTextField("Change phone number", Icons.person_outline, false,
  //             phoneController = TextEditingController(text: data["phone"])),
  //         reusableTextField("Change User Name", Icons.person_outline, false,
  //             profController = TextEditingController(text: data["profession"])),
  //         ElevatedButton(
  //             onPressed: () => updateData(), child: Text("Update Profile"))
  //       ],
  //       );
  // }

  // updateData() {
  //   CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection("users");
  //   return _collectionRef
  //       .doc()
  //       .update({
  //         "username": userNameTextController!.text,
  //         "phone": phoneController!.text,
  //         "profession": profController!.text,
  //       })
  //       .then((value) => print("Updated Successfully"))
  //       .whenComplete(
  //         () => Get.snackbar("Success!", "Updated profile data!",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
  //             colorText: Colors.white),
  //       )
  //       .catchError((error, stackTrace) {
  //         Get.snackbar("Error!", "Something went wrong. Try again.",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.redAccent.withOpacity(0.1),
  //             colorText: Colors.red);
  //         print(error.toString());
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Column(children: [
        const SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/profile.png'),
              ),
              Positioned(
                bottom: 0,
                right: -12,
                child: SizedBox(
                  height: 25,
                  width: 25,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: fetchUser("users"),
        ),

        SizedBox(height: 10),

        //profile card 1
        Padding(
          padding: EdgeInsets.all(20),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => myProfile()));
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.blue.withOpacity(0.3),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'My Profile',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),

        //profile card 2
        Padding(
          padding: EdgeInsets.all(20),
          child: TextButton(
            onPressed: null,
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.blue.withOpacity(0.3),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text(
                  'Help Center',
                  style: TextStyle(color: Colors.blue),
                )),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        //profile card 3
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.blue.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text('Log out')),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: const Icon(
        Icons.account_circle,
        color: Colors.indigo,
        size: 30,
      ),
      centerTitle: false,
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   ProfilePage({super.key});
//   void _redirectToHomePage(BuildContext context) {
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     var currentUser = _auth.currentUser;

//     // Create a reference to the user's document in Firestore.
//     final userDocumentReference =
//         FirebaseFirestore.instance.collection("users").doc(currentUser?.email);

//     return Column(
//       children: [
//         const Padding(padding: EdgeInsets.only(top: 80)),
//         const SizedBox(
//           height: 115,
//           width: 115,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage('lib/images/profile.png'),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: -12,
//                 child: SizedBox(
//                   height: 25,
//                   width: 25,
//                 ),
//               ),
//             ],
//           ),
//         ),

// //         //
// //         FutureBuilder<DocumentSnapshot>(
// //           future: userDocumentReference.get(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               // Display a loading indicator while data is being fetched.
// //               return CircularProgressIndicator();
// //             } else if (snapshot.hasError) {
// //               // Handle any errors that occur.
// //               return Text('Error: ${snapshot.error}');
// //             } else if (snapshot.hasData && snapshot.data!.exists) {
// //               // Data has been successfully fetched from Firestore.
// //               final data = snapshot.data!.data() as Map<String, dynamic>;
// //               final userName = data['email'];
// //               final profession = data['profession'];

//               return Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 20),
//                     Text(
//                       userName,
//                       style: TextStyle(
//                         fontSize: 26,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       profession,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               // Handle the case when the document does not exist.
//               return Text('Document does not exist');
//             }
//           },
//         ),

//         SizedBox(height: 20),

//         //profile card 1
//         Padding(
//           padding: EdgeInsets.all(20),
//           child: TextButton(
//             onPressed: null,
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.all(25),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               backgroundColor: Colors.blue.withOpacity(0.3),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.account_circle_sharp,
//                   size: 30,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: Text(
//                     'My Profile',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//           ),
//         ),

//         //profile card 2
//         Padding(
//           padding: EdgeInsets.all(20),
//           child: TextButton(
//             onPressed: null,
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.all(25),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               backgroundColor: Colors.blue.withOpacity(0.3),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.info_outline_rounded,
//                   size: 30,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                     child: Text(
//                   'Help Center',
//                   style: TextStyle(color: Colors.blue),
//                 )),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//           ),
//         ),

//         //profile card 3
//         GestureDetector(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LoginPage(),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: TextButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut().then((value) {
//                   print("Signed Out");
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => LoginPage()));
//                 });
//               },
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.all(25),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 backgroundColor: Colors.blue.withOpacity(0.3),
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.logout_rounded,
//                     size: 30,
//                     color: Colors.blue,
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(child: Text('Log out')),
//                   Icon(Icons.arrow_forward_ios),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
