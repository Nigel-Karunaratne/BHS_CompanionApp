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
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.grey[50],),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, color: Colors.grey[50],),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center, color: Colors.grey[50],),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.grey[50],),
          ),
        ],
      ),
    );
  }
}