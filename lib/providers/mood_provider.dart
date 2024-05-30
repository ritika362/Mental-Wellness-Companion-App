import 'package:flutter/foundation.dart';
import 'package:health/models/mood.dart';

class MoodProvider with ChangeNotifier {
  List<Mood> _moods = [];

  List<Mood> get moods => _moods;

  void setMood(Mood mood) {
    _moods.add(mood);
    notifyListeners();
  }
}
