import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/reminder_provider.dart';
import '../../models/reminder.dart';
import 'package:intl/intl.dart';

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  String _formatDateTime() {
    if (_selectedDate == null || _selectedTime == null) {
      return '';
    } else {
      final DateTime fullDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
      return DateFormat('yyyy-MM-dd – HH:mm').format(fullDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Add Reminder',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: _selectedDate == null
                          ? 'Select Date'
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                    ),
                    decoration: InputDecoration(labelText: 'Date'),
                    onTap: () => _selectDate(context),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: _selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context),
                    ),
                    decoration: InputDecoration(labelText: 'Time'),
                    onTap: () => _selectTime(context),
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _selectedDate != null &&
                    _selectedTime != null) {
                  final newReminder = Reminder(
                    title: _titleController.text,
                    time: _formatDateTime(),
                  );
                  reminderProvider.addReminder(newReminder);
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
