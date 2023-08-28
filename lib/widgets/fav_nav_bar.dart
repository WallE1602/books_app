import 'package:flutter/material.dart';

class FavNavbar extends StatelessWidget {
  const FavNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Favourites',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
