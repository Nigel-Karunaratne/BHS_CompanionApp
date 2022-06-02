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
        title: const Center(child: Text("Schedule View")),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text("Nothing to see here :("),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}