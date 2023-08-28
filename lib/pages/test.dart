// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('User Data'),
//         ),
//         body: UserDataWidget(),
//       ),
//     );
//   }
// }

// class UserDataWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return fetchData(
//         "users"); // Replace "users" with your Firestore collection name
//   }

//   Widget fetchData(String collectionName) {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       return Center(
//         child: Text("User not authenticated"),
//       );
//     }

//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection(collectionName)
//           .doc(user.uid) // Use the user's UID as the document ID
//           .snapshots(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text("Something is wrong"),
//           );
//         }

//         if (!snapshot.hasData || !snapshot.data!.exists) {
//           return Center(
//             child: Text("User data not found"),
//           );
//         }

//         var userData = snapshot.data!.data() as Map<String, dynamic>;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Username: ${userData['username']}",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               "Phone: ${userData['phone']}",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue, // Change the color as needed
//               ),
//             ),
//             Text(
//               "Profession: ${userData['profession']}",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue, // Change the color as needed
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }
