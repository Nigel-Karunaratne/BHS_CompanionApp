//! Only here for development purposes: remove when buildng release app
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
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
    return MaterialApp(
      title: 'MaterialApp/Title',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      initialRoute: "/map",
      routes: {
        "/map": (context) => MapView(),
        "/sched": (context) => ScheduleView(),
        "/helpful": (context) => HelpfulLinksView(),
        "/qr": (context) => QRScannerView(),
      },
      // home: MapView(),

    onGenerateRoute: (settings) {
      if (settings.name == '/map') 
        return PageRouteBuilder(pageBuilder: (_, __, ___) => MapView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
      if (settings.name == '/sched') 
        return PageRouteBuilder(pageBuilder: (_, __, ___) => ScheduleView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
      if (settings.name == '/helpful') 
        return PageRouteBuilder(pageBuilder: (_, __, ___) => HelpfulLinksView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
      if (settings.name == '/qr') 
        return PageRouteBuilder(pageBuilder: (_, __, ___) => QRScannerView(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
     return null;
    },

    );
  }
}