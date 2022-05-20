//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bhs__companion__app/models/map_model.dart';
import 'package:bhs__companion__app/models/roomsearchdelegate.dart';
import 'package:bhs__companion__app/views/widgets/widgets_all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({ Key? key }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 5.0,
        children: [
          FloatingActionButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            mini: true,
        
            child: Text("2"),
            heroTag: null,
            onPressed: () {
              Provider.of<MapProvider>(context, listen: false).changeFloor(2);
            },
          ),
          FloatingActionButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            mini: true,
        
            child: Text("1"),
            heroTag: null,
            onPressed: () {
              Provider.of<MapProvider>(context, listen: false).changeFloor(1);
            },
          ),
        ]
      ),
      appBar: AppBar(
        title: Text("Map Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch( //shows search bar?
                context: context,
                delegate: RoomSearchDelegate()
              );
            },
          )
        ],
      ),
      body: MapDisplay(),
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
            icon: Icon(Icons.location_on,),
            label: "Map"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner,),
            label: "QR Scanner"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center,),
            label: "Helpful Links"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule,),
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