// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapProvider extends ChangeNotifier {
  BuildContext? mapBuildContext;
  int currentFloor = 1;
  bool showMarkers = true;
  MapObjectData? qrCodeData;

  void showResultsBottomSheet(BuildContext context, MapObjectData data) {
    showBottomSheet(context: context, builder: (context) {
      if(data.roomDescription == null) {
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
                Text(data.roomNumber, textScaleFactor: 2,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                Text(data.locationDescription ?? "", style: TextStyle(color: Colors.white,)),
              ] 
            ),
          ),
        );
      }
      else {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data.roomNumber, textScaleFactor: 2,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      Text(data.locationDescription ?? "", style: TextStyle(color: Colors.white,)),
                    ] 
                  ),
                ),
                VerticalDivider(width: 10,),
                Expanded(
                  child: Center(
                    child: Text(data.roomDescription!, style: TextStyle(color: Colors.white,),)
                  )
                ),
              ],
            ),
          ),
        );
      }

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

  void qrToMap(BuildContext context, MapObjectData data) async {
    qrCodeData = data;
    Navigator.of(context).pushReplacementNamed("/map");
    debugPrint("\n\n\nPushed.\n\n\n");
    await Future.delayed(Duration(seconds: 1)); //Pretty sure this is safe.
    showOverlayFromProvider(data, mapBuildContext??context);
  }
}

class MapObjectData {
  String roomNumber = "";
  String? locationDescription;
  String? roomDescription;

  MapObjectData(String _roomNumber, {this.locationDescription, this.roomDescription}) {
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
    "187": MapObjectData("187"),
    "188": MapObjectData("188", locationDescription: "In the health hall"),
    "189": MapObjectData("189", locationDescription: "In thr healdfja hall", roomDescription: "This room is used for bla blah blah... it wowd sdam dmaf dad aslfnlemda jdnwjd s dlwk as djr sd sal ddw ds kl"),
  };
}