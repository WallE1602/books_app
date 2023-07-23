import 'package:books_app/pages/intro.dart';
import 'package:books_app/widgets/fav_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void _redirectToHomePage(BuildContext context) {
    // Replace this with the logic to redirect to the homepage.
    // For demonstration purposes, we'll just navigate back to the homepage.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 35)),
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/profile.jpg'),
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
              fontSize: 26, color: Colors.indigo, fontWeight: FontWeight.bold),
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
              backgroundColor: Color(0xFFF5F6F9),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 30,
                  color: Colors.indigo,
                ),
                SizedBox(width: 20),
                Expanded(child: Text('My Profile')),
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
              backgroundColor: Color(0xFFF5F6F9),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 30,
                  color: Colors.indigo,
                ),
                SizedBox(width: 20),
                Expanded(child: Text('Help Center')),
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
              builder: (context) => IntroPage(),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xFFF5F6F9),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: 30,
                    color: Colors.indigo,
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
