//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  const MapView({ Key? key }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
      ),
      body: Container(
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: 0,

        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey[50],
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        unselectedIconTheme: IconThemeData(color: Colors.grey[50]),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.grey[50],),
            label: "Map"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, color: Colors.grey[50],),
            label: "QR Scanner"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center, color: Colors.grey[50],),
            label: "Helpful Links"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.grey[50],),
            label: "Schedule"
          ),
        ],

        onTap: (index) {
          //TODO: Abtract this into a provider?
          Navigator.of(context).pushReplacementNamed("/qr");
        },
      ),
    );
  }
}