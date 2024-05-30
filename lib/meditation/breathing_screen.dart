import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
  @override
  _BreathingScreenState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  bool _isRunning = false;
  int _roundCount = 0;
  String _exerciseText = 'Get ready to start'; // Initial exercise text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breathing Exercise'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Breathing exercises are a fundamental component of relaxation techniques and have profound effects on both the mind and body. ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 60),
              Text(
                'Round: $_roundCount',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                _exerciseText,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isRunning =
                        !_isRunning; // Toggle _isRunning to start/stop the exercise
                  });
                  if (!_isRunning) {
                    // If exercise is stopped, reset round count and exercise text
                    setState(() {
                      _roundCount = 0;
                      _exerciseText = 'Get ready to start';
                    });
                  } else {
                    // If exercise is started, reset exercise text and start the exercise loop
                    setState(() {
                      _exerciseText = 'Breathe In';
                    });
                    _runExercise();
                  }
                },
                child: Text(_isRunning ? 'Stop Exercise' : 'Start Exercise'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _runExercise() async {
    while (_isRunning) {
      setState(() {
        _exerciseText = 'Breathe In';
      });
      await Future.delayed(Duration(seconds: 4));
      if (!_isRunning) break;

      setState(() {
        _exerciseText = 'Hold Breathe';
      });
      await Future.delayed(Duration(seconds: 4));
      if (!_isRunning) break;

      setState(() {
        _exerciseText = 'Breathe Out';
      });
      await Future.delayed(Duration(seconds: 4));
      if (!_isRunning) break;

      setState(() {
        _exerciseText = 'Hold Breathe';
      });
      await Future.delayed(Duration(seconds: 4));
      if (!_isRunning) break;

      setState(() {
        _roundCount++;
      });
    }
    setState(() {
      _exerciseText = 'Exercise Stopped';
    });
  }
}
