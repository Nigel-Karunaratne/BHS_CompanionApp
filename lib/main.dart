//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bhs__companion__app/models/map_model.dart';
import 'package:bhs__companion__app/models/qrscanner_model.dart';
import 'package:bhs__companion__app/models/resources_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:bhs__companion__app/views/views_all.dart';

void main() {
  runApp(
    MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(
          create: (context) => MapProvider(),
        ),
        ChangeNotifierProvider<QRScannerProvider>(
          create: (context) => QRScannerProvider(),
        ),
        ChangeNotifierProvider<ResourcesProvider>(
          create: (context) => ResourcesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'MaterialApp/Title',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
    
        initialRoute: "/map",
        routes: {
          "/map": (context) => MapView(),
          // "/sched": (context) => ScheduleView(), //* Deprecated feature as of now, we didn't know how to effectively implement it.
          "/resources": (context) => ResourcesView(),
          "/qr": (context) => QRScannerView(),
        },
        // home: MapView(),
    
      onGenerateRoute: (settings) {
        if (settings.name == '/map') {
          return PageRouteBuilder(pageBuilder: (_, __, ___) => MapView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
        }
        if (settings.name == '/sched') {
          return PageRouteBuilder(pageBuilder: (_, __, ___) => ScheduleView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
        }
        if (settings.name == '/helpful') {
          return PageRouteBuilder(pageBuilder: (_, __, ___) => ResourcesView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
        }
        if (settings.name == '/qr') {
          return PageRouteBuilder(pageBuilder: (_, __, ___) => QRScannerView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
        }
       return null;
      },
    
      ),
    );
  }
}