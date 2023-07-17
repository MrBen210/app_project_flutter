import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';
import 'package:app_project_flutter/widgets/events_grid.dart';

class EventsFutureBuilderWidget extends StatelessWidget {
  final Future<List<Event>> eventsFuture;

  const EventsFutureBuilderWidget({
    required this.eventsFuture,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: eventsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Event>? events = snapshot.data;
          print('Events data received: $events');
          return EventsGrid(events: events!);
        } else {
          return const Center(child: Text('Aucun événement trouvé.'));
        }
      },
    );
  }
}
