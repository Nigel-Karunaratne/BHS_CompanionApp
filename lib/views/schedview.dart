//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:bhs__companion__app/views/widgets/widgets_all.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({ Key? key }) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Schedule View")),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
      body: Container(
        
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}