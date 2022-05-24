// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerProvider extends ChangeNotifier {
  void parseBarcode(BuildContext context, Barcode barcode) {
    debugPrint(barcode.rawValue!);

    //! Debug: Show a popup box that contains the data
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        title: const Text('Popup example'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(barcode.rawValue!),
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