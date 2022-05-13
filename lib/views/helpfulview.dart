//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

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
        title: Text("Helpful Links Page"),
      ),
      body: Container(
        
      ),
    );
  }
}