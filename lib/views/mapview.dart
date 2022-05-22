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
            backgroundColor: Colors.red[800],
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
            backgroundColor: Colors.red[800],
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
        automaticallyImplyLeading: false, //* Makes back arrow not show up even when bottom sheet is being displayed.
        title: Center(child: Text("BHS School Map")),
        backgroundColor: Colors.red[800],
        elevation: 0,
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
      
        backgroundColor: Colors.red[800],
        selectedItemColor: Colors.grey[50],
        unselectedItemColor: Colors.grey[500],
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey[50]),

        selectedFontSize: 0,
        unselectedFontSize: 0,
      
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_map.png", scale: 3,),
            label: "Map"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_camera.png", scale: 3,),
            label: "QR Scanner"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_questionmark.png", scale: 3,),
            label: "Helpful Links"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_3dots.png", scale: 3,),
            label: "Schedule"
          ),
        ],
      
        onTap: (index) {
          //TODO: Abtract this into a provider?
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed("/map");
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed("/sched");
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed("/helpful");
              break;
            case 3:
              Navigator.of(context).pushReplacementNamed("/qr");
              break;
          }
        },
      ),
    );
  }
}