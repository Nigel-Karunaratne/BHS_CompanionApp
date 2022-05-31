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
// This should really be in it's own file (maybe another .dart file, maybe abstracted to an xml or something) 
// but it's waaaaaaaaaaaayyyy to late for me to try anything like that so here it is.
class RoomData {
  static Map<String, MapObjectData> dataMap = {
    //! 1st Floor
    "154": MapObjectData("154"),
    "152": MapObjectData("152",),
    "Atheltic Director": MapObjectData("Atheltic Director"),
    "150": MapObjectData("150",),
    "Fitness Center": MapObjectData("Fitness Center",),
    "151": MapObjectData("151",),

    "146": MapObjectData("146",),
    "144": MapObjectData("144",),
    "142": MapObjectData("142",),
    "140": MapObjectData("140",),
    "147": MapObjectData("147",),
    "145": MapObjectData("145",),
    "143": MapObjectData("143",),
    "141": MapObjectData("141",),
    "134": MapObjectData("134",),
    "122": MapObjectData("122",),
    "136": MapObjectData("136",),
    "120": MapObjectData("120",),
    "132": MapObjectData("132",),
    "130": MapObjectData("130",),
    "124": MapObjectData("124",),
    "126": MapObjectData("126",),
    "169 / Lecture Hall": MapObjectData("169 / Lecture Hall",),

    "161 / Chorus": MapObjectData("161 / Chorus",),
    "Band Room": MapObjectData("Band Room",),
    "160": MapObjectData("160",),
    "162": MapObjectData("162",),
    "164": MapObjectData("164",),
    "Auditorium": MapObjectData("Auditorium", locationDescription: "The Fogelberg Performing Arts Center",),

    "Nurse": MapObjectData("Nurse", locationDescription: "Close to the Main Office"),
    "Mail Room": MapObjectData("Mail Room", locationDescription: "Close to the Main Office"),
    "Main Office": MapObjectData("Main Office",),
    "Guidance Conference": MapObjectData("Guidance Conference", locationDescription: "Close to the Main Office",),
    "Guidance": MapObjectData("Guidance", locationDescription: "Close to the Main Office",),

    "Cafeteria B": MapObjectData("Cafeteria B",),
    "Cafeteria A": MapObjectData("Cafeteria A",),

    "125": MapObjectData("125",),
    "123": MapObjectData("123",),
    "121": MapObjectData("121",),
    "104": MapObjectData("104",),
    "102": MapObjectData("102",),
    "100": MapObjectData("100",),
    "109": MapObjectData("109",),
    "113": MapObjectData("113",),

    "107": MapObjectData("107",),
    "113": MapObjectData("113",),
    "101": MapObjectData("101",),
    "103": MapObjectData("103",),
    "105 / Bridge": MapObjectData("105 / Bridge",),
    "BCAT": MapObjectData("BCAT",),
    "Area 123": MapObjectData("Area 123",),

    "Lower Library": MapObjectData("Lower Library",),
    "Tech Offices": MapObjectData("Tech Offices",),
    "Upper Library": MapObjectData("Upper Library",),
    "Writing Center": MapObjectData("Writing Center",),
    "Help Desk": MapObjectData("Help Desk", locationDescription: "In the upper library", roomDescription: "The Help Desk is the place to go for all your tech-related problems. The 'Technology Integration' classes are also taught here."),
  
    //! Lower Floor
    "Boy's Locker Room": MapObjectData("Boy's Locker Room"),
    "Dance Room": MapObjectData("Dance Room"),
    "Girl's Locker Room": MapObjectData("Girl's Locker Room"),
    "Gymnastics Room": MapObjectData("Gymnastics Room"),
    "Rubber Gym": MapObjectData("Rubber Gym"),
    "Wooden Gym": MapObjectData("Wooden Gym"),
    "Wrestling Room": MapObjectData("Wrestling Room"),

    //! 2nd Floor
    "200": MapObjectData("200"),
    "201": MapObjectData("201"),
    "202": MapObjectData("202"),
    "203": MapObjectData("203"),
    "204": MapObjectData("204"),
    "205": MapObjectData("205"),
    "206": MapObjectData("206"),
    "207": MapObjectData("207"),
    "208": MapObjectData("208"),
    "209": MapObjectData("209"),
    "210": MapObjectData("210"),
    "211": MapObjectData("211"),
    "212": MapObjectData("212"),
    "213": MapObjectData("213"),
    "214": MapObjectData("214"),
    "215": MapObjectData("215"),
    "216": MapObjectData("216"),
    "217": MapObjectData("217"),
    "219": MapObjectData("219"),
    "300": MapObjectData("300"),
    "301": MapObjectData("301"),
    "302": MapObjectData("302"),
    "303": MapObjectData("303"),
    "304": MapObjectData("304"),
    "305": MapObjectData("305"),
    "306": MapObjectData("306"),
    "307": MapObjectData("307"),
    "308": MapObjectData("308"),
    "309": MapObjectData("309"),
    "310 / LABB": MapObjectData("310 / LABB"),
    "311": MapObjectData("311"),
    "313": MapObjectData("313"),
    "314": MapObjectData("314"),
    "315": MapObjectData("315"),
    "316": MapObjectData("316"),
    "317": MapObjectData("317"),
    "318": MapObjectData("318"),
    "320": MapObjectData("320"),
    "322": MapObjectData("322"),
    "324": MapObjectData("324"),
    "400": MapObjectData("400"),
    "401": MapObjectData("401"),
    "402": MapObjectData("402"),
    "403": MapObjectData("403"),
    "404": MapObjectData("404"),
    "405": MapObjectData("405"),
    "406": MapObjectData("406"),
    "407": MapObjectData("407"),
    "408": MapObjectData("408"),
    "409": MapObjectData("409"),
    "410": MapObjectData("410"),
    "411": MapObjectData("411"),
    "412": MapObjectData("412"),
    "413": MapObjectData("413"),
    "414": MapObjectData("414"),
    "416": MapObjectData("416"),
    "418": MapObjectData("418"),
  };
}