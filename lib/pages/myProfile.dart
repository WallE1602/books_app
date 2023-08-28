import 'package:books_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class myProfile extends StatefulWidget {
  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _ageController;

  setDataToTextField(data) {
    return Column(
      children: [
        TextFormField(
          controller: _nameController =
              TextEditingController(text: data['username']),
        ),
        TextFormField(
          controller: _phoneController =
              TextEditingController(text: data['phone']),
        ),
        TextFormField(
          controller: _ageController =
              TextEditingController(text: data['profession']),
        ),
        ElevatedButton(onPressed: () => updateData(), child: Text("Update"))
      ],
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "username": _nameController!.text,
      "phone": _phoneController!.text,
      "profession": _ageController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            // var data = snapshot.data;
            final data = snapshot.data?.data();
            if (data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return setDataToTextField(data);
            }
          },
        ),
      )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Profile Edit",
        style: TextStyle(color: kPrimaryColor),
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,

      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("lib/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // leading: Padding(
      //   padding: const EdgeInsets.only(left: 10.0),
      //   child: const Icon(
      //     Icons.manage_accounts_outlined,
      //     color: kPrimaryColor,
      //     size: 30,
      //   ),
      // ),
      // IconButton(
      //   padding: EdgeInsets.only(left: kDefaultPadding),
      //   icon: SvgPicture.asset("lib/icons/back.svg"),
      //   onPressed: () {
      //     // Navigator.pop(context);
      //   },
      // ),
      centerTitle: false,
    );
  }
}
