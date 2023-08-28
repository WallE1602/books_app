import 'package:books_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget fetchUser(String collectionName) {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return Center(
      child: Text("User not authenticated"),
    );
  }
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(collectionName)
        .doc(user.uid)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      if (!snapshot.hasData || !snapshot.data!.exists) {
        return Center(
          child: Text("Not Working"),
        );
      }

      var userData = snapshot.data?.data() as Map<String, dynamic>;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${userData['username']}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Phone: ${userData['phone']}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor, // Change the color as needed
            ),
          ),
          Text(
            "Profession: ${userData['profession']}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Change the color as needed
            ),
          ),
        ],
      );
    },
  );
}
