import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircularMenu(),
    );
  }
}

class CircularMenu extends StatefulWidget {
  CircularMenuState createState() => CircularMenuState();
}

class CircularMenuState extends State<CircularMenu> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextEditingController _controller = new TextEditingController();
    List<String> items = [
      '1.20',
      '2.20',
      '3.20',
      '4.20',
      '5.20',
      '6.20',
      '7.20',
      '8.20',
      '1.20',
      '2.20',
      '3.20',
      '4.20',
      '5.20',
      '6.20',
      '7.20',
      '8.20'
    ];

    // TODO: implement build
    return Scaffold(
      floatingActionButton: Builder(
        key: fabKey,
        builder: (context) => FabCircularMenu(
          onDisplayChange: (isOpen) {
            isOpen ? _pressed = true : _pressed = false;
            print(_pressed);
          },
          alignment: Alignment.topLeft,
          ringColor: Colors.transparent,
          ringDiameter: 300.0,
          ringWidth: 100.0,
          fabSize: 50.0,
          fabElevation: 8.0,
          fabColor: Colors.transparent,
          fabOpenIcon: Image.asset('assets/image/logo.png'),
          fabCloseIcon: Image.asset('assets/image/logo.png'),
          fabMargin: const EdgeInsets.all(25.0),
          animationDuration: const Duration(milliseconds: 200),
          animationCurve: Curves.bounceIn,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: width * 0.03, bottom: height * 0.08),
              child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: SvgPicture.asset('assets/svg/user.svg'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: width * 0.07, bottom: height * 0.065),
              child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: SvgPicture.asset('assets/svg/notification.svg'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: width * 0.1, bottom: height * 0.03),
              child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: SvgPicture.asset('assets/svg/search.svg'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: width * 0.1, bottom: height * 0.001),
              child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child:
                    SvgPicture.asset('assets/svg/home.svg', color: Colors.blue),
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.2,
                  width: width * 0.4,
                  // color: const Color.fromRGBO(252, 252, 252, 1),
                ),
                // Positioned(
                //   left: width * 0.02,
                //   top: height * 0.03,
                //   child: Image.asset('assets/image/logo.png'),
                // ),
                Positioned(
                    // top: height * 0.035,
                    // left: width * 0.07,
                    // child: _pressed
                    //     ? SvgPicture.asset('assets/svg/round-bg.svg')
                    //     : Container(color: Colors.yellow),
                    child:
                        // !_pressed
                        //     ? SvgPicture.asset('assets/svg/round-bg.svg',
                        //         color: Colors.transparent)
                        //     : SvgPicture.asset(
                        //         'assets/svg/round-bg.svg',
                        //         //  color: Colors.transparent
                        //       ),
                        SvgPicture.asset(
                  'assets/svg/round-bg.svg',
                  // color: Colors.transparent,
                )),
              ],
            ),
          ],
        ),
      ),
    );
    //   ),
    // );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:fab_circular_menu/fab_circular_menu.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Theme.of(context).primaryColor;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           color: const Color(0xFF192A56),
//           child: Center(
//             child: RaisedButton(
//               onPressed: () {
//                 // The menu can be handled programatically using a key
//                 if (fabKey.currentState!.isOpen) {
//                   fabKey.currentState!.close();
//                 } else {
//                   fabKey.currentState!.open();
//                 }
//               },
//               color: Colors.white,
//               child: Text('Toggle menu programatically',
//                   style: TextStyle(color: primaryColor)),
//             ),
//           ),
//         ),
//         floatingActionButton: Builder(
//           builder: (context) => FabCircularMenu(
//             key: fabKey,
//             // Cannot be `Alignment.center`
//             alignment: Alignment.bottomRight,
//             ringColor: Colors.white.withAlpha(25),
//             ringDiameter: 500.0,
//             ringWidth: 150.0,
//             fabSize: 64.0,
//             fabElevation: 8.0,
//             fabIconBorder: CircleBorder(),
//             // Also can use specific color based on wether
//             // the menu is open or not:
//             // fabOpenColor: Colors.white
//             // fabCloseColor: Colors.white
//             // These properties take precedence over fabColor
//             fabColor: Colors.white,
//             fabOpenIcon: Icon(Icons.menu, color: primaryColor),
//             fabCloseIcon: Icon(Icons.close, color: primaryColor),
//             fabMargin: const EdgeInsets.all(16.0),
//             animationDuration: const Duration(milliseconds: 800),
//             animationCurve: Curves.easeInOutCirc,
//             onDisplayChange: (isOpen) {
//               _showSnackBar(
//                   context, "The menu is ${isOpen ? "open" : "closed"}");
//             },
//             children: <Widget>[
//               RawMaterialButton(
//                 onPressed: () {
//                   _showSnackBar(context, "You pressed 1");
//                 },
//                 shape: CircleBorder(),
//                 padding: const EdgeInsets.all(24.0),
//                 child: Icon(Icons.looks_one, color: Colors.white),
//               ),
//               RawMaterialButton(
//                 onPressed: () {
//                   _showSnackBar(context, "You pressed 2");
//                 },
//                 shape: CircleBorder(),
//                 padding: const EdgeInsets.all(24.0),
//                 child: Icon(Icons.looks_two, color: Colors.white),
//               ),
//               RawMaterialButton(
//                 onPressed: () {
//                   _showSnackBar(context, "You pressed 3");
//                 },
//                 shape: CircleBorder(),
//                 padding: const EdgeInsets.all(24.0),
//                 child: Icon(Icons.looks_3, color: Colors.white),
//               ),
//               RawMaterialButton(
//                 onPressed: () {
//                   _showSnackBar(context,
//                       "You pressed 4. This one closes the menu on tap");
//                   fabKey.currentState!.close();
//                 },
//                 shape: CircleBorder(),
//                 padding: const EdgeInsets.all(24.0),
//                 child: Icon(Icons.looks_4, color: Colors.white),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(BuildContext context, String message) {
//     Scaffold.of(context).showSnackBar(SnackBar(
//       content: Text(message),
//       duration: const Duration(milliseconds: 1000),
//     ));
//   }
// }
