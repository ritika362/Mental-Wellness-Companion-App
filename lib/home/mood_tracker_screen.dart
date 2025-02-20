import 'package:flutter/material.dart';
import 'package:health/providers/mood_provider.dart';
import 'package:provider/provider.dart';

class MoodTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood History',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: moodProvider.moods.length,
          itemBuilder: (context, index) {
            final mood = moodProvider.moods[index];
            return Card(
              child: ListTile(
                title: Text(
                  mood.mood,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(mood.date.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
