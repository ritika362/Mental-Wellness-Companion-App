import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhysicalExercise {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  PhysicalExercise({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });
}

class PhysicalExerciseScreen extends StatefulWidget {
  @override
  _PhysicalExerciseScreenState createState() => _PhysicalExerciseScreenState();
}

class _PhysicalExerciseScreenState extends State<PhysicalExerciseScreen> {
  List<PhysicalExercise> _PhysicalExercises = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchPhysicalExercises();
  }

  Future<void> _fetchPhysicalExercises() async {
    const String muscle = 'biceps';
    const String url =
        'https://api.api-ninjas.com/v1/exercises?muscle=' + muscle;
    const Map<String, String> headers = {
      'X-Api-Key': 'bVIjED+8znoCfKI9s4YMkg==GW35XHO5NVzLidOs'
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      print('HTTP Response Status: ${response.statusCode}');
      print('HTTP Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print('Parsed Data: $data'); // Debug statement

        final List<PhysicalExercise> PhysicalExercises = data.map((item) {
          return PhysicalExercise(
            name: item['name'] ?? 'No name',
            type: item['type'] ?? 'No type',
            muscle: item['muscle'] ?? 'No muscle',
            equipment: item['equipment'] ?? 'No equipment',
            difficulty: item['difficulty'] ?? 'No difficulty',
            instructions: item['instructions'] ?? 'No instructions',
          );
        }).toList();

        setState(() {
          _PhysicalExercises = PhysicalExercises;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load health resources: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load health resources: $e';
        _isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physical Exercises'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text(_error))
              : ListView.builder(
                  itemCount: _PhysicalExercises.length,
                  itemBuilder: (context, index) {
                    final PhysicalExercise = _PhysicalExercises[index];
                    return ListTile(
                      title: Text(PhysicalExercise.name),
                      subtitle: Text(
                          'Type: ${PhysicalExercise.type}\nMuscle: ${PhysicalExercise.muscle}\nEquipment: ${PhysicalExercise.equipment}\nDifficulty: ${PhysicalExercise.difficulty}\nInstructions: ${PhysicalExercise.instructions}'),
                    );
                  },
                ),
    );
  }
}
