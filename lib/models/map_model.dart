// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapProvider extends ChangeNotifier {
  BuildContext? mapBuildContext;
  int currentFloor = 1;
  bool showMarkers = true;

  void showResultsBottomSheet(BuildContext context, MapObjectData data) {
    showBottomSheet(context: context, builder: (context) {
      return Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.red[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${data.roomNumber} icon was clicked.",textScaleFactor: 2,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              Text(data.locationDescription ?? "", style: TextStyle(color: Colors.white,)),
            ] 
          ),
        ),
      );
    });
  }

  void changeFloor(int newFloor) {
    currentFloor = newFloor;
    notifyListeners();
  }

  void showOverlayFromProvider(MapObjectData data, BuildContext context) {
    Provider.of<MapProvider>(context, listen: false).showResultsBottomSheet(context, data);
    //Navigator.pop(context); //! This will remove the BottomSheet from the view
  }

  void toggleShowIcons() {
    showMarkers = !showMarkers;
    notifyListeners();
  }
}

class MapObjectData {
  String roomNumber = "";
  String? locationDescription;
  String? roomDescription;

  MapObjectData(String _roomNumber, {String? locationDescription, String? roomDescription}) {
    roomNumber = _roomNumber;
  }

}

//* UNIVERSAL MAP OF ROOMS
class RoomData {
  static Map<String, MapObjectData> dataMap = {
    // "": MapObjectData(""),
    "R1": MapObjectData("Room 1"),
    "R2": MapObjectData("Room 2"),
    "R3": MapObjectData("Room 3"),
    "R4": MapObjectData("Room 4"),
    "R5": MapObjectData("Room 5"),
  };
}