import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final String title;
  final String content;

  NotesScreen({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          content,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
