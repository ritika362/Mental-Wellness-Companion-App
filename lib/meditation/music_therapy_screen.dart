import 'package:flutter/material.dart';

class MusicTherapyScreen extends StatelessWidget {
  final List<String> songs = [
    "Weightless by Marconi Union",
    "Clair de Lune by Claude Debussy",
    "Kun Faya Kun from Rockstar",
    "Canzonetta Sull'aria by Mozart",
    "Phir Le Aya Dil (Reprise) from Barfi!",
    "Shankar Mahadevan's Breathless",
    "Nocturne in E-flat Major, Op. 9 No. 2 by Chopin",
    "Watermark by Enya",
    "Strawberry Swing by Coldplay",
    "Raabta (Night in a Motel) from Agent Vinod",
    "Electra by Airstream",
    "Mellomaniac (Chillout Mix) by DJ Shah",
    "Please Don't Go by Barcelona",
    "Tera Ban Jaunga from Kabir Singh",
    "Pure Shores by All Saints",
    "Madhura Madhura Meenakshi from Meenakshi Kalyanam",
    "Tum Hi Ho from Aashiqui 2",
    "Ae Watan (Female) from Raazi",
    "Zindagi Kuch Toh Bata (Reprise) from Bajrangi Bhaijaan",
    "Tum Mile (Reprise) from Tum Mile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Therapy for Relaxation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Importance of Music Therapy for Relaxation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Music therapy is an effective intervention for promoting relaxation and reducing stress. Listening to calming music can lower cortisol levels, improve mood, enhance sleep quality, and manage pain. Here are some songs that are known for their relaxing effects:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text(songs[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
