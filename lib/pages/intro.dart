import 'package:books_app/pages/home.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Image.asset('lib/images/cover.png', height: 250),
          ),

          const SizedBox(height: 48),

          const Text(
            'Boooks',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),

          Container(
            padding: const EdgeInsets.only(top: 15),
          ),

          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
