//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bhs__companion__app/models/map_model.dart';
import 'package:bhs__companion__app/models/roomsearchdelegate.dart';
import 'package:bhs__companion__app/views/widgets/widgets_all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({ Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    // if (Provider.of<MapProvider>(context, listen: false).qrCodeData != null) {
    //   Provider.of<MapProvider>(context, listen: false).showOverlayFromProvider(Provider.of<MapProvider>(context, listen: false).qrCodeData!, context);

    // }

    return Scaffold(
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 4.0,
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
          FloatingActionButton(
            backgroundColor: Colors.red[800],
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            mini: true,
        
            child: Text("B"),
            heroTag: null,
            onPressed: () {
              Provider.of<MapProvider>(context, listen: false).changeFloor(0);
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
        
            child: Icon(Icons.pin_drop),
            heroTag: null,
            onPressed: () {
              Provider.of<MapProvider>(context, listen: false).toggleShowIcons();
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
          ),
        ],
      ),
      body: MapDisplay(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}