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
    "187": MapObjectData("187"),
    "188": MapObjectData("188",),
    "189": MapObjectData("189",),
    "190": MapObjectData("190",),
    "Fitness Center": MapObjectData("Fitness Center",),

    "174": MapObjectData("174",),
    "176": MapObjectData("176",),
    "177": MapObjectData("177",),
    "179": MapObjectData("179",),
    "165": MapObjectData("165",),
    "173": MapObjectData("173",),
    "172": MapObjectData("172",),
    "156": MapObjectData("156",),
    "164": MapObjectData("164",),
    "157": MapObjectData("157",),
    "163": MapObjectData("163",),
    "167": MapObjectData("167",),
    "168": MapObjectData("168",),
    "171": MapObjectData("171",),
    "170": MapObjectData("170",),
    "169 / Lecture Hall": MapObjectData("169 / Lecture Hall",),
    "158": MapObjectData("158",),

    "191 / Chorus": MapObjectData("191 / Chorus",),
    "192": MapObjectData("192",),
    "Band Room": MapObjectData("Band Room",),
    "197 / Music Room": MapObjectData("197 / Music Room",),
    "Auditorium": MapObjectData("Auditorium", locationDescription: "The Fogelberg Performing Arts Center",),
    "1SS": MapObjectData("1SS",),
    "155": MapObjectData("155",),

    "Nurse": MapObjectData("Nurse", locationDescription: "Close to the Main Office"),
    "Mail Room": MapObjectData("Mail Room", locationDescription: "Close to the Main Office"),
    "Main Office": MapObjectData("Main Office",),
    "Guidance Conference": MapObjectData("Guidance Conference", locationDescription: "Close to the Main Office",),
    "Guidance": MapObjectData("Guidance", locationDescription: "Close to the Main Office",),

    "Cafeteria B": MapObjectData("Cafeteria B",),
    "Cafeteria A": MapObjectData("Cafeteria A",),

    "162": MapObjectData("162",),
    "161": MapObjectData("161",),
    "159": MapObjectData("159",),
    "137": MapObjectData("137",),
    "136": MapObjectData("136",),
    "134": MapObjectData("134",),
    "129": MapObjectData("129",),
    "128": MapObjectData("128",),

    "130A": MapObjectData("130A",),
    "130B": MapObjectData("130B",),
    "133 / Bridge": MapObjectData("133 / Bridge",),
    "132": MapObjectData("132",),
    "132 B": MapObjectData("132 B",),
    "BCAT": MapObjectData("BCAT",),

    "Lower Library": MapObjectData("Lower Library",),
    "Tech Offices": MapObjectData("Tech Offices",),
    "Upper Library": MapObjectData("Upper Library",),
    "Writing Center": MapObjectData("Writing Center",),
    "Help Desk": MapObjectData("Help Desk", locationDescription: "In the upper library", roomDescription: "The Help Desk is the place to go for all your tech-related problems. The 'Technology Integration' classes are also taught here."),
  };
}