import 'package:flutter/material.dart';
import 'package:health/providers/mood_provider.dart';
import 'package:provider/provider.dart';

class MoodTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood History',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: moodProvider.moods.length,
          itemBuilder: (context, index) {
            final mood = moodProvider.moods[index];
            return Card(
              child: ListTile(
                title: Text(
                  mood.mood,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(mood.date.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}














// import 'package:flutter/material.dart';

// class MoodTrackerScreen extends StatefulWidget {
//   @override
//   _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
// }

// class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
//   final List<Map<String, String>> moodLogs = [];

//   void addMood(String mood, String date) {
//     setState(() {
//       moodLogs.add({'mood': mood, 'date': date});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: Text('Mood Tracker',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//         ),
//         ),),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               final mood = 'Happy';
//               final date = DateTime.now().toIso8601String();
//               addMood(mood, date);
//             },
//             child: Text('Add Mood'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: moodLogs.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(moodLogs[index]['mood']!),
//                   subtitle: Text(moodLogs[index]['date']!),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
