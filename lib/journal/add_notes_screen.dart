import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  AddNoteScreenState createState() => AddNoteScreenState();
}

class AddNoteScreenState extends State<AddNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> titles = prefs.getStringList('Titles') ?? [];
    List<String> contents = prefs.getStringList('Contents') ?? [];

    titles.add(titleController.text);
    contents.add(contentController.text);

    await prefs.setStringList('Titles', titles);
    await prefs.setStringList('Contents', contents);

    Navigator.pop(context); // Close AddNoteScreen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Add Note',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 10,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: saveNote,
                child: Text(
                  'Save Note',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
