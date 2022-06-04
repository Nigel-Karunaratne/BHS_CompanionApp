import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        elevation: 0,
        title: const Center(
          child: Text("About the App"),
        ),
      ),
      backgroundColor: Colors.red[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                "EXPLORE BHS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "An app made by:\nNavya Garg, Nigel Karunaratne, and Rohan Varma",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40,),
              Text(
                "Special thanks to Mr. Wong, Mrs. Tyrrell, and Mrs. Doughty for allowing us to choose this project for our internship.\n\nAlso to our mentors, Christopher Fabiano and Monica Nowak for their incredible support.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}