import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  EventDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Afficher les détails de l'événement ici
            Text('Description: ${event.description}'),
            // Ajoutez d'autres informations de détail selon vos besoins
          ],
        ),
      ),
    );
  }
}
