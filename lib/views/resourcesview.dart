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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // crossAxisCount: 2,
          // mainAxisSpacing: 4,
          // crossAxisSpacing: 4,

          children: <Widget> [
            Text(
              "Below are some helpful links for BHS Students",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            Divider(color: Colors.red, thickness: 2.0, height: 20.0,),
            ResourcesButton(
              header: "Aspen",
              description: "Aspen contains all of your student information, which includes your classes and grades. It even has a schedule which shows you your classes for the day. Make sure you know your log in information!",
              pressed: Provider.of<ResourcesProvider>(context).openAspen,
            ),
            ResourcesButton(
              header: "BHS's Website",
              description: "BHS's official website has many useful features on it, from schedules and lunch menus to bus schedules and the Daily Bulletin, plus phone numbers for the Main Office & Absence Lines",
              pressed: Provider.of<ResourcesProvider>(context).openBhsWebsite,
            ),
            ResourcesButton(
              header: "Naviance",
              description: "Naviance will help you discover colleges. Sometimes, school administrators will make you take surveys on Naviance as well.",
              pressed: Provider.of<ResourcesProvider>(context).openNaviance,
            ),
            ResourcesButton(
              header: "Google Classroom",
              description: "Classroom is where your teachers will most likely be posting assignments. Log in with your school's Google account to see all of your upcoming assignments for almost all of your classes.",
              pressed: Provider.of<ResourcesProvider>(context).openClassroom,
            ),
            ResourcesButton(
              header: "BHS Library's Website",
              description: "The library's website contains information about Summer Reading, the required Digital Citizenship course, the full catalog of books available in the library, and even a list of databases you can use for research projects!",
              pressed: Provider.of<ResourcesProvider>(context).openBhsLibraryWebsite,
            ),
            ResourcesButton(
              header: "Gmail",
              description: "Teachers and school administrators will often send out important emails to you. Log in with your school's Google account to access your emails.",
              pressed: Provider.of<ResourcesProvider>(context).openGmail,
            ),
          ],
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
