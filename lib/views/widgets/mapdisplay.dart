// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhs__companion__app/models/map_model.dart';
import 'widgets_all.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({Key? key}) : super(key: key);

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  final TransformationController _transformationController = TransformationController();
  final bool showIcons = true;
  //! late AnimationController _animationController;
  //* late Animation<Matrix4> _mapAnimation; //these are only for animating between 

  @override
  Widget build(BuildContext context) {
    Provider.of<MapProvider>(context, listen: false).mapBuildContext = context;
    int currentFloor = Provider.of<MapProvider>(context).currentFloor;
    bool showMarkers = Provider.of<MapProvider>(context).showMarkers;
    return OverflowBox(
      child: InteractiveViewer(
        maxScale: 3,
        minScale: 0.5,
        constrained: false,
        boundaryMargin: const EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
      
        child: Builder(
          builder: (context) {
            switch(currentFloor) {
              case 0:
                return FloorLowerStack(showIcons: showMarkers);
              case 1:
                return Floor1Stack(showIcons: showMarkers);
              case 2:
                return Floor2Stack(showIcons: showMarkers);
              default:
                return Floor1Stack(showIcons: false);
            }
          }),
      
        transformationController: _transformationController,  
        onInteractionUpdate: (details) {
          //* double correctScaleValue = _transformationController.value.getMaxScaleOnAxis();
          //* print(correctScaleValue);
        },   
        onInteractionEnd: (details) {
          
        },
      ),
    );
  }

  @override
  void initState() {
    _transformationController.value.translate(-500.0,-400.0,0.0);
    super.initState();
  }

  @override
  void dispose() {
    //! _animationController.dispose();
    super.dispose();
  }

  void createAnimation() {

  }
}

class Floor1Stack extends StatefulWidget {
  const Floor1Stack({Key? key, required this.showIcons}) : super(key: key);

  final bool showIcons;
  @override
  State<Floor1Stack> createState() => _Floor1StackState();
}

class _Floor1StackState extends State<Floor1Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? layoutWithIcons() : [
        Center(
          child: Image.asset(
          "assets/img/map_floor1.png",
          ),
        ),
      ],
    );
  }

  List<Widget> layoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floor1.png",
        ),
      ),

      // * Dark Green (Health)
      MapButton(id: "154", top: 360, left: 660),
      MapButton(id: "152", top: 360, left: 720),
      MapButton(id: "Atheltic Director", top: 345, left: 780),
      MapButton(id: "150", top: 360, left: 850),
      MapButton(id: "Fitness Center", top: 470, left: 780),
      MapButton(id: "151", top: 430, left: 925),

      // * Light Purple (science)
      MapButton(id: "146", top: 560, left: 655),
      MapButton(id: "144", top: 560, left: 745),
      MapButton(id: "142", top: 560, left: 825),
      MapButton(id: "140", top: 560, left: 925),
      MapButton(id: "147", top: 660, left: 655),
      MapButton(id: "145", top: 660, left: 745),
      MapButton(id: "143", top: 660, left: 825),
      MapButton(id: "141", top: 660, left: 925),
      MapButton(id: "134", top: 785, left: 655),
      MapButton(id: "122", top: 785, left: 925),
      MapButton(id: "136", top: 860, left: 650),
      MapButton(id: "120", top: 860, left: 925),
      MapButton(id: "132", top: 830, left: 730),
      MapButton(id: "130", top: 880, left: 730),
      MapButton(id: "124", top: 830, left: 845),
      MapButton(id: "126", top: 880, left: 845),
      MapButton(id: "169 / Lecture Hall", top: 850, left: 790),

      // * Dark Blue (Music)
      MapButton(id: "161 / Chorus", top: 610, left: 1105),
      MapButton(id: "Band Room", top: 610, left: 1280),
      MapButton(id: "160", top: 700, left: 1210),
      MapButton(id: "162", top: 700, left: 1270),
      MapButton(id: "164", top: 700, left: 1380),
      MapButton(id: "Auditorium", top: 880, left: 1235),

      // * Red (Main Office)
      MapButton(id: "Nurse", top: 1080, left: 1235),
      MapButton(id: "Mail Room", top: 1080, left: 1360),
      MapButton(id: "Main Office", top: 1180, left: 1145),
      MapButton(id: "Guidance Conference", top: 1170, left: 1290),
      MapButton(id: "Guidance", top: 1170, left: 1380),

      // * Magenta (Cafeteria)
      MapButton(id: "Cafeteria B", top: 1350, left: 1210),
      MapButton(id: "Cafeteria A", top: 1580, left: 1180),

      // * Orange (Foreign Languages)
      MapButton(id: "125", top: 940, left: 690),
      MapButton(id: "123", top: 940, left: 760),
      MapButton(id: "121", top: 940, left: 910),
      MapButton(id: "104", top: 1340, left: 670),
      MapButton(id: "102", top: 1340, left: 740),
      MapButton(id: "100", top: 1340, left: 910),
      MapButton(id: "109", top: 1430, left: 665),
      MapButton(id: "113", top: 1510, left: 665),

      // * Yellow + Cyan ()
      MapButton(id: "107", top: 1410, left: 735),
      MapButton(id: "111", top: 1450, left: 735),
      MapButton(id: "101", top: 1410, left: 865),
      MapButton(id: "103", top: 1450, left: 865),
      MapButton(id: "105 / Bridge", top: 1430, left: 800),
      MapButton(id: "BCAT", top: 1515, left: 730),
      MapButton(id: "Area 123", top: 1610, left: 760),

      // * Light Green (Libary Area)
      MapButton(id: "Lower Library", top: 1040, left: 790),
      MapButton(id: "Tech Offices", top: 1140, left: 765),
      MapButton(id: "Upper Library", top: 1230, left: 790),
      MapButton(id: "Writing Center", top: 1010, left: 935),
      MapButton(id: "Help Desk", top: 1270, left: 650),
    ];
  }
}

class Floor2Stack extends StatefulWidget {
  const Floor2Stack({Key? key, required this.showIcons}) : super(key: key);
  final bool showIcons;
  
  @override
  State<Floor2Stack> createState() => _Floor2StackState();
}

class _Floor2StackState extends State<Floor2Stack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,  
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? showLayoutWithIcons() : [
        Center(
          child: Image.asset(
            "assets/img/map_floor2.png",
          ),
        ),
      ],
    );
  }

  List<Widget> showLayoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floor2.png",
        ),
      ),

      //* History Hall
      MapButton(id: "401", top: 650, left: 720),
      MapButton(id: "403", top: 650, left: 815),
      MapButton(id: "405", top: 650, left: 900),
      MapButton(id: "407", top: 650, left: 980),
      MapButton(id: "409", top: 660, left: 1165),
      MapButton(id: "411", top: 660, left: 1235),
      MapButton(id: "413", top: 660, left: 1300),

      MapButton(id: "400", top: 725, left: 655),
      MapButton(id: "402", top: 725, left: 705),
      MapButton(id: "404", top: 725, left: 755),
      MapButton(id: "406", top: 725, left: 925),
      MapButton(id: "408", top: 725, left: 985),
      MapButton(id: "410", top: 740, left: 1045),
      MapButton(id: "412", top: 740, left: 1255),
      MapButton(id: "418", top: 740, left: 1320),

      MapButton(id: "414", top: 815, left: 1170),
      MapButton(id: "416", top: 815, left: 1330),

      //* English Hall
      MapButton(id: "301", top: 870, left: 200),
      MapButton(id: "303", top: 870, left: 300),
      MapButton(id: "305", top: 870, left: 400),
      MapButton(id: "307", top: 870, left: 470),
      MapButton(id: "309", top: 890, left: 705),
      MapButton(id: "311", top: 890, left: 770),
      MapButton(id: "313", top: 890, left: 870),
      MapButton(id: "315", top: 890, left: 930),
      MapButton(id: "317", top: 890, left: 995),

      MapButton(id: "300", top: 960, left: 180),
      MapButton(id: "302", top: 960, left: 245),
      MapButton(id: "304", top: 960, left: 310),
      MapButton(id: "306", top: 960, left: 380),
      MapButton(id: "308", top: 960, left: 450),
      MapButton(id: "310 / LABB", top: 960, left: 520),

      MapButton(id: "314", top: 970, left: 595),
      MapButton(id: "316", top: 970, left: 660),
      MapButton(id: "318", top: 970, left: 750),
      MapButton(id: "320", top: 970, left: 890),
      MapButton(id: "322", top: 970, left: 970),
      MapButton(id: "324", top: 970, left: 1025),

      //* Math Hall
      MapButton(id: "201", top: 1120, left: 680),
      MapButton(id: "203", top: 1120, left: 735),
      MapButton(id: "205", top: 1120, left: 930),
      MapButton(id: "207", top: 1120, left: 995),

      MapButton(id: "209", top: 1115, left: 1140),
      MapButton(id: "219", top: 1050, left: 1185),
      MapButton(id: "217", top: 1055, left: 1280),
      MapButton(id: "215", top: 1055, left: 1350),
      MapButton(id: "211", top: 1115, left: 1285),
      MapButton(id: "213", top: 1115, left: 1350),
      
      MapButton(id: "200", top: 1200, left: 570),
      MapButton(id: "202", top: 1200, left: 650),
      MapButton(id: "204", top: 1200, left: 740),
      MapButton(id: "206", top: 1200, left: 830),
      MapButton(id: "208", top: 1200, left: 925),
      MapButton(id: "210", top: 1200, left: 1025),

      MapButton(id: "212", top: 1185, left: 1160),
      MapButton(id: "214", top: 1190, left: 1235),
      MapButton(id: "216", top: 1190, left: 1295),
    ];
  }
}

class FloorLowerStack extends StatefulWidget {
  const FloorLowerStack({Key? key, required this.showIcons}) : super(key: key);
  final bool showIcons;

  @override
  State<FloorLowerStack> createState() => _FloorLowerStackState();
}

class _FloorLowerStackState extends State<FloorLowerStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,  
      clipBehavior: Clip.hardEdge,
      children: widget.showIcons ? showLayoutWithIcons() : [
        Center(
          child: Image.asset(
            "assets/img/map_floorB.png",
          ),
        ),
      ],
    );
  }

  List<Widget> showLayoutWithIcons() {
    return [
      Center(
        child: Image.asset(
          "assets/img/map_floorB.png",
        ),
      ),

      //* Dark Red
      MapButton(id: "Wooden Gym", top: 1090, left: 370),
      MapButton(id: "Wrestling Room", top: 1000, left: 750),
      MapButton(id: "Rubber Gym", top: 1290, left: 820),
      MapButton(id: "Gymnastics Room", top: 1290, left: 1100),

      //* Light Blue (Locker Rooms)
      MapButton(id: "Boy's Locker Room", top: 810, left: 890),
      MapButton(id: "Girl's Locker Room", top: 1030, left: 1040),

      //* Light Purple ()
      MapButton(id: "Dance Room", top: 990, left: 1390),
    ];
  }
}
