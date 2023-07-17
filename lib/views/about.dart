import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 150,
              backgroundImage: AssetImage("assets/climhard1.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pojets de master Climhard',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
            ),
            Text(
              'Version 1.0.1',
              style: TextStyle(fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
