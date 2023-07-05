import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePages.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 120.0, right: 80, bottom: 40, top: 160),
            child: Image.asset('images/avocado.png'),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              "we deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "fresh items everyday",
            style: TextStyle(color: Colors.grey[600]),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(24),
              child: Text(
                "get started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
