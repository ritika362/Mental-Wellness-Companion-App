// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/reminder_provider.dart';

// class ReminderScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final reminderProvider = Provider.of<ReminderProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reminders'),
//       ),
//       body: ListView.builder(
//         itemCount: reminderProvider.reminders.length,
//         itemBuilder: (context, index) {
//           final reminder = reminderProvider.reminders[index];
//           return ListTile(
//             title: Text(reminder.title),
//             subtitle: Text(reminder.time),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/add_reminder');
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }















// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:shared_preferences/shared_preferences.dart';


// // class ReminderScreen extends StatefulWidget {
// //   @override
// //   _ReminderScreenState createState() => _ReminderScreenState();
// // }

// // class _ReminderScreenState extends State<ReminderScreen> {
// //   final List<Map<String, String>> reminders = [];

// //   void addReminder(String reminder, String time) {
// //     setState(() {
// //       reminders.add({'reminder': reminder, 'time': time});
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Reminders')),
// //       body: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: () {
// //               final reminder = 'Take a break';
// //               final time = DateTime.now().toIso8601String();
// //               addReminder(reminder, time);
// //             },
// //             child: Text('Add Reminder'),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: reminders.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(reminders[index]['reminder']!),
// //                   subtitle: Text(reminders[index]['time']!),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
