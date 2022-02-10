import "package:mcc_app/pages/home_screen.dart";
import "package:mcc_app/pages/form.dart";
import "package:mcc_app/pages/human_face.dart";
import "package:mcc_app/pages/gps.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _listChildren = [
    const HomeList(),
    const FormWid(),
    const HumanFace(),
    const GetLocation(),
  ];
  int _currentIndex = 0;

  void onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
       body: _listChildren[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         elevation: 1,
         unselectedItemColor: Colors.red[200],
         selectedItemColor: Colors.blue,
         currentIndex: _currentIndex,
         items: const [
           BottomNavigationBarItem(
               icon: Icon(Icons.people),
               label: "Data list",
               backgroundColor: Colors.blue
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.add),
             label: "Form",
             backgroundColor: Colors.blue,
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.face),
             label: "Face",
             backgroundColor: Colors.blue,
           ),
           BottomNavigationBarItem(
               icon: Icon(Icons.add_location),
               backgroundColor: Colors.blue,
               label: "Location"
           ),
         ],
         onTap: onTapped,
       ),
     );
  }
}