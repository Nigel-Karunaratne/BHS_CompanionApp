import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: 0,
      
        backgroundColor: Colors.red[800],
        selectedItemColor: Colors.grey[50],
        unselectedItemColor: Colors.grey[500],
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey[50]),

        selectedFontSize: 0,
        unselectedFontSize: 0,
      
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_camera.png", scale: 3,),
            label: "QR Scanner"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_map.png", scale: 3,),
            label: "Map"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/bn_questionmark.png", scale: 3,),
            label: "Helpful Links"
          ),
          //* THIS IS FOR A CUT FEATURE
          // BottomNavigationBarItem(
          //   icon: Image.asset("assets/icons/bn_3dots.png", scale: 3,),
          //   label: "Schedule"
          // ),
        ],
      
        onTap: (index) {
          //TODO: Abtract this into a provider?
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed("/map");
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed("/qr");
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed("/resources");
              break;
            case 3:
              Navigator.of(context).pushReplacementNamed("/sched");
              break;
          }
        },
      );
  }
}