import 'package:flutter/material.dart';
import '../models/reminder.dart';

class ReminderProvider with ChangeNotifier {
  final List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  void addReminder(Reminder reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }
}
