// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

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
        title: Text("Schedule Page"),
      ),
      body: Container(
        
      ),
    );
  }
}