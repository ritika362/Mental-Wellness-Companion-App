import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health/navigation_bar.dart';
import 'add_notes_screen.dart';
import 'notes_screen.dart';

class JournalScreen extends StatefulWidget {
  @override
  JournalScreenState createState() => JournalScreenState();
}

class JournalScreenState extends State<JournalScreen> {
  List<Map<String, String>> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> titles = prefs.getStringList('Titles') ?? [];
    List<String> contents = prefs.getStringList('Contents') ?? [];

    setState(() {
      notes = List.generate(titles.length, (index) {
        return {'Title': titles[index], 'Content': contents[index]};
      });
    });
  }

  deleteNote(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> titles = prefs.getStringList('Titles') ?? [];
    List<String> contents = prefs.getStringList('Contents') ?? [];

    titles.removeAt(index);
    contents.removeAt(index);

    await prefs.setStringList('Titles', titles);
    await prefs.setStringList('Contents', contents);

    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text(
            'Journal',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  notes[index]['Title']!,
                  style: TextStyle(fontSize: 24),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.black),
                  onPressed: () {
                    deleteNote(index);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotesScreen(
                        title: notes[index]['Title']!,
                        content: notes[index]['Content']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        width: 220.0,
        height: 50.0,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            'Write your thought now',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()),
            ).then((_) {
              loadNotes();
            });
          },
        ),
      ),
    );
  }
}
