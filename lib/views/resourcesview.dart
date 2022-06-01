//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bhs__companion__app/models/resources_model.dart';
import 'package:flutter/material.dart';
import 'package:bhs__companion__app/views/widgets/widgets_all.dart';
import 'package:provider/provider.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({Key? key}) : super(key: key);

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: <Widget> [
              ResourcesButton(
                header: "Aspen",
                description: "Aspen contains all of your student information, which includes your classes and grades. It even has a schedule. Make sure you know your log in information!",
                pressed: Provider.of<ResorcesProvider>(context).openAspen,
              ),
              ResourcesButton(
                header: "Naviance",
                description: "Naviance is...",
                pressed: Provider.of<ResorcesProvider>(context).openNaviance,
              ),
            ],
          )
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
