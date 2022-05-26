// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'map_model.dart';

class QRScannerProvider extends ChangeNotifier {

  //* NOTE: The raw text from each QR Code should be: {key} ||| Scan with the BHS Companion App to see where you are in the school!
  //* The key NEEDS TO BE INSIDE THE CURLY BRACES. Anything after the curly braces can be different. 
  void parseBarcode(BuildContext context, Barcode barcode) {
    debugPrint(barcode.rawValue!);

    bool found = false;
    String newVal = "";

    //Cycle through the raw string and extract anything in between the curly braces (inclusive) if possible
    for(int i = 0; i < barcode.rawValue!.length; i++) {
      newVal += barcode.rawValue!.characters.elementAt(i);
      if(newVal[newVal.length-1] == "}" && newVal[0] == "{") {
        found = true;
        break;
      }
    }
    //If curly braces were found, remove them and try to search for the key in the dictionary (Map). (this needs to be implemented)
    if(found) {
      newVal = newVal.substring(1, newVal.length-1); //This removes the curly braces
      MapObjectData? object = RoomData.dataMap[newVal];
      if(object != null) {
        //Map Marker Exists
        debugPrint("Marker Found.");

        //* Move to Map Screen
        // Navigator.pushReplacementNamed(context, "/map", arguments: {"floor":2});
        Provider.of<MapProvider>(context, listen: false).qrToMap(context, object);
        // Provider.of<MapProvider>(context, listen: false).showOverlayFromProvider(object, context);
      }
      else {
        debugPrint("NOT FOUND");
      }
    }
    

    //! Debug: Show a popup box that contains the data
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        title: const Text('Read Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(newVal),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      )
    );
  }
}