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
        color: Colors.black12,
        height: double.infinity,
        child: EventDetail(event: event),
      ),
    );
  }
}

class EventDetail extends StatelessWidget {
  final Event event;

  EventDetail({required this.event});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EventCoverImage(coverImagee: event.imageUrl),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: EventDescription(description: event.description),
        ),
      ],
    );
  }
}

class EventCoverImage extends StatelessWidget {
  final String? coverImagee;

  EventCoverImage({required this.coverImagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: coverImagee != null
          ? Image.network(
        coverImagee!,
        fit: BoxFit.fitWidth,
      )
          : Placeholder(), // Placeholder ou image par défaut si coverImagee est null
    );
  }
}

class EventDescription extends StatelessWidget {
  final String? description;

  EventDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return description != null
        ? Text(description!)
        : Placeholder(); // Placeholder ou texte par défaut si description est null
  }
}
