//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:io' show Platform;
import 'package:bhs__companion__app/models/qrscanner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:bhs__companion__app/views/widgets/widgets_all.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({ Key? key }) : super(key: key);

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  MobileScannerController cameraController = MobileScannerController();
  Barcode? readBarcode;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("QR Scanner")),
          backgroundColor: Colors.red[800],
          elevation: 0,
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: Center(child: Text("Scanning QR Codes is not supported on this platform!\nThis feature is only supported on Android and IOS."),),
      );

    }
    else { //platform is either ios or android
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("QR Scanner")),
          backgroundColor: Colors.red[800],
          elevation: 0,
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  Provider.of<QRScannerProvider>(context, listen: false).parseBarcode(context, barcode);
                  // debugPrint('Barcode found! $code');
                }
              }
            ),

            //* Output Dialogue 
            Positioned(
              bottom: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white30,
                ),
                child: Text(
                  "Scan a QR Code to see where you are on the map!",
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //* Controls for Flashlight & Flipping Camera
            Positioned(
              top: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.torchState,
                        builder: (context, state, child) {
                          switch (state as TorchState) {
                            case TorchState.off:
                              return const Icon(Icons.flash_off, color: Colors.grey);
                            case TorchState.on:
                              return const Icon(Icons.flash_on, color: Colors.yellow);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.toggleTorch(),
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.cameraFacingState,
                        builder: (context, state, child) {
                          switch (state as CameraFacing) {
                            case CameraFacing.front:
                              return const Icon(Icons.camera_front);
                            case CameraFacing.back:
                              return const Icon(Icons.camera_rear);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.switchCamera(),
                    ),
                          
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}