import 'package:flutter/material.dart';
import 'package:health/meditation/physical_exercise.dart';
import 'package:health/meditation/breathing_screen.dart';
import 'package:health/meditation/music_therapy_screen.dart';
import 'package:health/navigation_bar.dart';

class MeditationScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Meditation Exercises',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      bottomNavigationBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Try these methods for relaxing',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Image.asset('images/breathe.jpeg'),
                      title: Text(
                        'Breathing\nExercise',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BreathingScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.music_note),
                      ),
                      title: Text(
                        'Music Therapy',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MusicTherapyScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset('images/pic.jpeg'),
                      title: Text(
                        'Physical Exercise',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhysicalExerciseScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add spacing between sections
            // Second Section
          ],
        ),
      ),
    );
  }
}
