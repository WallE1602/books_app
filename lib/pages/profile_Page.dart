import 'package:books_app/pages/intro.dart';
import 'package:books_app/pages/login.dart';
import 'package:books_app/widgets/fav_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void _redirectToHomePage(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 80)),
        SizedBox(
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
                  height: 46,
                  width: 46,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Shah Farhan Abid',
          style: TextStyle(
              fontSize: 26, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Software Engineer',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),

        //profile card 1
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
      ],
    );
  }
}
