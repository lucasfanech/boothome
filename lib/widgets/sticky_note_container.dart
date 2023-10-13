import 'package:boothome/widgets/sticky_note.dart';
import 'package:flutter/material.dart';


class StickyNoteContainer extends StatelessWidget {
  // Créer le tableau d'événements
  final List<Map<String, dynamic>> events = [
    {
      'text': '1Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'color': Colors.blue,
    },
    {
    'text': '2Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'color': Colors.red,
    },
    {
      'text': '3Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'color': Colors.green,
    },
    // Ajoutez d'autres notes ici
    // ...
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int maxNotesPerRow = screenWidth ~/ 300; // Calcul du nombre de colonnes en fonction de la largeur de l'écran

    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: maxNotesPerRow,
          childAspectRatio: 16 / 9,
        ),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = events[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Container(
                color: Colors.white,
                child: StickyNote(
                  text: event['text'],
                  color: event['color'],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}