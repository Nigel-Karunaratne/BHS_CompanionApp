//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:bhs__companion__app/views/widgets/widgets_all.dart';

class HelpfulLinksView extends StatefulWidget {
  const HelpfulLinksView({ Key? key }) : super(key: key);

  @override
  State<HelpfulLinksView> createState() => _HelpfulLinksState();
}

class _HelpfulLinksState extends State<HelpfulLinksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Helpful Links for BHS Students")),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Here will be buttons that link students to useful websites such as Aspen, Google Classroom, Naviance, etc.", textAlign: TextAlign.center,)
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}