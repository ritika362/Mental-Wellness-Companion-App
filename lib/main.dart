import 'package:flutter/material.dart';
import 'package:health/home/mood_tracker_screen.dart';
import 'package:health/providers/mood_provider.dart';
import 'dart:async';
import 'home/home_screen.dart';
import 'package:provider/provider.dart';
import 'providers/reminder_provider.dart';
import 'home/add_reminder_screen.dart';
import 'home/reminder_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MoodProvider()),
      ChangeNotifierProvider(create: (_) => ReminderProvider()),
    ],
    child: MentalWellnessCompanionApp(),
  ));
}

class MentalWellnessCompanionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Wellness Companion',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add_reminder': (context) => AddReminderScreen(),
        '/reminders': (context) => ReminderScreen(),
        '/mood-tracking': (context) => MoodTrackerScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mental Wellness Companion',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
