import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reminder_provider.dart';

class ReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: reminderProvider.reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminderProvider.reminders[index];
          return ListTile(
            title: Text(reminder.title),
            subtitle: Text(reminder.time),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_reminder');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
