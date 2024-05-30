import 'package:flutter/material.dart';
import 'package:health/meditation/physical_exercise.dart';
import 'package:health/home/home_screen.dart';
import 'package:health/journal/journal_screen.dart';
import 'package:health/meditation/meditation_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[900],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.self_improvement),
          label: 'Meditation Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Journal',
        )
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (index == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MeditationScreen()),
          );
        } else if (index == 2) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => JournalScreen()),
          );
        }
      },
    );
  }
}






// class NavBar extends StatefulWidget {
//   @override
//   NavBarState createState() => NavBarState();
// }

// class NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;

//   static List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     BreathingScreen(),
//     JournalScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.self_improvement),
//             label: 'Breathing',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Journal',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
