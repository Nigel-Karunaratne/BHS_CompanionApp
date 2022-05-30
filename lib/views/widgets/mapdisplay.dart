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
  //* late Animation<Matrix4> _mapAnimation;

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
      
      
        child: GridPaper(
          // child: (currentFloor == 1 ? 
          //   (showMarkers ? Floor1StackIcon() : Floor1Stack()) : (showMarkers ? Floor2StackIcon() : Floor2Stack()) 
          // ),
          child: Builder(
            builder: (context) {
              switch(currentFloor) {
                case 0:
                  return FloorBasementStack(showIcons: showMarkers);
                case 1:
                  return Floor1Stack(showIcons: showMarkers);
                case 2:
                  return Floor2Stack(showIcons: showMarkers);
                default:
                  return Floor1Stack(showIcons: false);
              }
            }),
        ),
      
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
      // MapButton(id: "154", top: 360, left: 660),
      // MapButton(id: "152", top: 360, left: 720),
      // MapButton(id: "Atheltic Director", top: 345, left: 780),
      // MapButton(id: "150", top: 360, left: 850),
      // MapButton(id: "Fitness Center", top: 470, left: 780),
      // MapButton(id: "151", top: 430, left: 925),

      // * Light Purple (science)
      // MapButton(id: "146", top: 560, left: 655),
      // MapButton(id: "144", top: 560, left: 745),
      // MapButton(id: "142", top: 560, left: 825),
      // MapButton(id: "140", top: 560, left: 925),
      // MapButton(id: "147", top: 660, left: 655),
      // MapButton(id: "145", top: 660, left: 745),
      // MapButton(id: "143", top: 660, left: 825),
      // MapButton(id: "141", top: 660, left: 925),
      // MapButton(id: "134", top: 785, left: 655),
      // MapButton(id: "122", top: 785, left: 925),
      // MapButton(id: "136", top: 860, left: 650),
      // MapButton(id: "120", top: 860, left: 925),
      // MapButton(id: "132", top: 830, left: 730),
      // MapButton(id: "130", top: 880, left: 730),
      // MapButton(id: "124", top: 830, left: 845),
      // MapButton(id: "126", top: 880, left: 845),
      // MapButton(id: "169 / Lecture Hall", top: 850, left: 790),

      // * Dark Blue (Music)
      // MapButton(id: "161 / Chorus", top: 610, left: 1105),
      // MapButton(id: "Band Room", top: 610, left: 1280),
      // MapButton(id: "160", top: 700, left: 1210),
      // MapButton(id: "162", top: 700, left: 1270),
      // MapButton(id: "164", top: 700, left: 1380),
      // MapButton(id: "Auditorium", top: 880, left: 1235),

      // * Red (Main Office)
      // MapButton(id: "Nurse", top: 1080, left: 1235),
      // MapButton(id: "Mail Room", top: 1080, left: 1360),
      // MapButton(id: "Main Office", top: 1180, left: 1145),
      // MapButton(id: "Guidance Conference", top: 1170, left: 1290),
      // MapButton(id: "Guidance", top: 1170, left: 1380),

      // * Magenta (Cafeteria)
      // MapButton(id: "Cafeteria B", top: 1350, left: 1210),
      // MapButton(id: "Cafeteria A", top: 1580, left: 1180),

      // * Orange (Foreign Languages)
      // MapButton(id: "125", top: 940, left: 690),
      // MapButton(id: "123", top: 940, left: 760),
      // MapButton(id: "121", top: 940, left: 910),
      // MapButton(id: "104", top: 1340, left: 670),
      // MapButton(id: "102", top: 1340, left: 740),
      // MapButton(id: "100", top: 1340, left: 910),
      // MapButton(id: "109", top: 1430, left: 665),
      // MapButton(id: "113", top: 1510, left: 665),

      // * Yellow + Cyan ()
      // MapButton(id: "107", top: 1410, left: 735),
      // MapButton(id: "113", top: 1450, left: 735),
      // MapButton(id: "101", top: 1410, left: 865),
      // MapButton(id: "103", top: 1450, left: 865),
      // MapButton(id: "105 / Bridge", top: 1430, left: 800),
      // MapButton(id: "BCAT", top: 1515, left: 730),
      // MapButton(id: "Area 123", top: 1610, left: 760),

      // * Light Green (Libary Area)
      // MapButton(id: "Lower Library", top: 1040, left: 790),
      // MapButton(id: "Tech Offices", top: 1140, left: 765),
      // MapButton(id: "Upper Library", top: 1230, left: 790),
      // MapButton(id: "Writing Center", top: 1010, left: 935),
      // MapButton(id: "Help Desk", top: 1270, left: 650),
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

      MapButton(id: "R1", top: 100, left: 200),
    ];
  }
}

class FloorBasementStack extends StatefulWidget {
  const FloorBasementStack({Key? key, required this.showIcons}) : super(key: key);
  final bool showIcons;

  @override
  State<FloorBasementStack> createState() => _FloorBasementStackState();
}

class _FloorBasementStackState extends State<FloorBasementStack> {
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

      MapButton(id: "R1", top: 100, left: 200),
    ];
  }
}
