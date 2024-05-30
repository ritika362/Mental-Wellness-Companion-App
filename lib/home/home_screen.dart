import 'package:flutter/material.dart';
import 'package:health/home/add_reminder_screen.dart';
import 'package:health/providers/mood_provider.dart';
import 'package:health/models/mood.dart';
import 'package:provider/provider.dart';
import '../../providers/reminder_provider.dart';
import 'package:health/navigation_bar.dart';
import 'mood_tracker_screen.dart';
import 'reminder_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);

    final reminderProvider = Provider.of<ReminderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text('Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😄', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Excited'));
                          },
                        ),
                        Text('Excited'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😊', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Happy'));
                          },
                        ),
                        Text('Happy'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😐', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Normal'));
                          },
                        ),
                        Text('Normal'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😟', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Sad'));
                          },
                        ),
                        Text('Sad'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😠', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Frustrated'));
                          },
                        ),
                        Text('Frustrated'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Text('😕', style: TextStyle(fontSize: 40.0)),
                          onPressed: () {
                            moodProvider.setMood(
                                Mood(date: DateTime.now(), mood: 'Confused'));
                          },
                        ),
                        Text('Confused'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mood-tracking');
                  },
                  child: Text('Check your mood history'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Reminders',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: reminderProvider.reminders.length,
                    itemBuilder: (context, index) {
                      final reminder = reminderProvider.reminders[index];
                      return ListTile(
                        title: Text(reminder.title),
                        subtitle: Text(reminder.time),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddReminderScreen()));
        },
        child: const Icon(Icons.add),
      ),

      /*
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Reminders'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReminderScreen()),
                    );
                  },
                  child: Text('Add Reminder'),
                ),
              ],
            ),
          ),
        ],
      ),*/
      bottomNavigationBar: NavBar(),
    );
  }
}
