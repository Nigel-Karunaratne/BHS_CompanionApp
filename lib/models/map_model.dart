// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapProvider extends ChangeNotifier {
  BuildContext? mapBuildContext;
  int currentFloor = 1;
  bool showMarkers = false;
  MapObjectData? qrCodeData;

  void showResultsBottomSheet(BuildContext context, MapObjectData data) {
    if(data.floor != currentFloor) {
      changeFloor(data.floor);
    }
    
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
    qrCodeData = data; //I don't think I ended up using this, but at this point I'm too afraid to remove it.
    Navigator.of(context).pushReplacementNamed("/map");
    changeFloor(data.floor);
    await Future.delayed(Duration(seconds: 1)); //Pretty sure this is safe.
    showOverlayFromProvider(data, mapBuildContext??context);
  }
}

class MapObjectData {
  String roomNumber = "";
  int floor = 1;
  String? locationDescription;
  String? roomDescription;

  MapObjectData(String _roomNumber, int _floor, {this.locationDescription, this.roomDescription}) {
    roomNumber = _roomNumber;
    floor = _floor;
  }

}

//* UNIVERSAL MAP OF ROOMS
// This should really be in it's own file (maybe another .dart file, maybe abstracted to an xml or something) 
// but it's waaaaaaaaaaaayyyy to late for me to try anything like that so here it is.
class RoomData {
  static Map<String, MapObjectData> dataMap = {
    //! 1st Floor
    "154": MapObjectData("154", 1,),
    "152": MapObjectData("152", 1,),
    "Atheltic Director": MapObjectData("Atheltic Director",  1,),
    "150": MapObjectData("150", 1,),
    "Fitness Center": MapObjectData("Fitness Center", 1,),
    "151": MapObjectData("151", 1,),

    "146": MapObjectData("146", 1,),
    "144": MapObjectData("144", 1,),
    "142": MapObjectData("142", 1,),
    "140": MapObjectData("140", 1,),
    "147": MapObjectData("147", 1,),
    "145": MapObjectData("145", 1,),
    "143": MapObjectData("143", 1,),
    "141": MapObjectData("141", 1,),
    "134": MapObjectData("134", 1,),
    "122": MapObjectData("122", 1,),
    "136": MapObjectData("136", 1,),
    "120": MapObjectData("120", 1,),
    "132": MapObjectData("132", 1,),
    "130": MapObjectData("130", 1,),
    "124": MapObjectData("124", 1,),
    "126": MapObjectData("126", 1,),
    "169 / Lecture Hall": MapObjectData("169 / Lecture Hall", 1,),

    "161 / Chorus": MapObjectData("161 / Chorus", 1,),
    "Band Room": MapObjectData("Band Room", 1,),
    "160": MapObjectData("160", 1,),
    "162": MapObjectData("162", 1,),
    "164": MapObjectData("164", 1,),
    "Auditorium": MapObjectData("Auditorium", 1, locationDescription: "The Fogelberg Performing Arts Center",),

    "Nurse": MapObjectData("Nurse", 1, locationDescription: "Close to the Main Office"),
    "Mail Room": MapObjectData("Mail Room", 1, locationDescription: "Close to the Main Office"),
    "Main Office": MapObjectData("Main Office", 1,),
    "Guidance Conference": MapObjectData("Guidance Conference", 1, locationDescription: "Close to the Main Office",),
    "Guidance": MapObjectData("Guidance", 1, locationDescription: "Close to the Main Office",),

    "Cafeteria B": MapObjectData("Cafeteria B", 1,),
    "Cafeteria A": MapObjectData("Cafeteria A", 1,),

    "125": MapObjectData("125", 1,),
    "123": MapObjectData("123", 1,),
    "121": MapObjectData("121", 1,),
    "104": MapObjectData("104", 1,),
    "102": MapObjectData("102", 1,),
    "100": MapObjectData("100", 1,),
    "109": MapObjectData("109", 1,),
    "113": MapObjectData("113", 1,),

    "107": MapObjectData("107", 1,),
    "111": MapObjectData("111", 1,),
    "101": MapObjectData("101", 1,),
    "103": MapObjectData("103", 1,),
    "105 / Bridge": MapObjectData("105 / Bridge", 1,),
    "BCAT": MapObjectData("BCAT", 1,),
    "Area 123": MapObjectData("Area 123", 1,),

    "Lower Library": MapObjectData("Lower Library", 1,),
    "Tech Offices": MapObjectData("Tech Offices", 1,),
    "Upper Library": MapObjectData("Upper Library", 1,),
    "Writing Center": MapObjectData("Writing Center", 1,),
    "Help Desk": MapObjectData("Help Desk", 1, locationDescription: "In the upper library", roomDescription: "The Help Desk is the place to go for all your tech-related problems. The 'Technology Integration' classes are also taught here."),
  
    //! Lower Floor
    "Boy's Locker Room": MapObjectData("Boy's Locker Room", 0,),
    "Dance Room": MapObjectData("Dance Room", 0,),
    "Girl's Locker Room": MapObjectData("Girl's Locker Room", 0,),
    "Gymnastics Room": MapObjectData("Gymnastics Room", 0,),
    "Rubber Gym": MapObjectData("Rubber Gym", 0,),
    "Wooden Gym": MapObjectData("Wooden Gym", 0,),
    "Wrestling Room": MapObjectData("Wrestling Room", 0,),

    //! 2nd Floor
    "200": MapObjectData("200", 2,),
    "201": MapObjectData("201", 2,),
    "202": MapObjectData("202", 2,),
    "203": MapObjectData("203", 2,),
    "204": MapObjectData("204", 2,),
    "205": MapObjectData("205", 2,),
    "206": MapObjectData("206", 2,),
    "207": MapObjectData("207", 2,),
    "208": MapObjectData("208", 2,),
    "209": MapObjectData("209", 2,),
    "210": MapObjectData("210", 2,),
    "211": MapObjectData("211", 2,),
    "212": MapObjectData("212", 2,),
    "213": MapObjectData("213", 2,),
    "214": MapObjectData("214", 2,),
    "215": MapObjectData("215", 2,),
    "216": MapObjectData("216", 2,),
    "217": MapObjectData("217", 2,),
    "219": MapObjectData("219", 2,),
    "300": MapObjectData("300", 2,),
    "301": MapObjectData("301", 2,),
    "302": MapObjectData("302", 2,),
    "303": MapObjectData("303", 2,),
    "304": MapObjectData("304", 2,),
    "305": MapObjectData("305", 2,),
    "306": MapObjectData("306", 2,),
    "307": MapObjectData("307", 2,),
    "308": MapObjectData("308", 2,),
    "309": MapObjectData("309", 2,),
    "310 / LABB": MapObjectData("310 / LABB", 2,),
    "311": MapObjectData("311", 2,),
    "313": MapObjectData("313", 2,),
    "314": MapObjectData("314", 2,),
    "315": MapObjectData("315", 2,),
    "316": MapObjectData("316", 2,),
    "317": MapObjectData("317", 2,),
    "318": MapObjectData("318", 2,),
    "320": MapObjectData("320", 2,),
    "322": MapObjectData("322", 2,),
    "324": MapObjectData("324", 2,),
    "400": MapObjectData("400", 2,),
    "401": MapObjectData("401", 2,),
    "402": MapObjectData("402", 2,),
    "403": MapObjectData("403", 2,),
    "404": MapObjectData("404", 2,),
    "405": MapObjectData("405", 2,),
    "406": MapObjectData("406", 2,),
    "407": MapObjectData("407", 2,),
    "408": MapObjectData("408", 2,),
    "409": MapObjectData("409", 2,),
    "410": MapObjectData("410", 2,),
    "411": MapObjectData("411", 2,),
    "412": MapObjectData("412", 2,),
    "413": MapObjectData("413", 2,),
    "414": MapObjectData("414", 2,),
    "416": MapObjectData("416", 2,),
    "418": MapObjectData("418", 2,),
  };
}