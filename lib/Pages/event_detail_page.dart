import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({required this.event});
  final Event event;

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
          child: EventUtils(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: EventDescription(descriptionText: event.description),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: EventTag(),
        ),
      ],
    );
  }
}

class EventCoverImage extends StatelessWidget {
  final String coverImagee;

  EventCoverImage({required this.coverImagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Image.network(
        coverImagee,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class EventDescription extends StatelessWidget {
  final String descriptionText;

  EventDescription({required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Text(
      descriptionText,
      textAlign: TextAlign.start,
    );
  }
}

class EventUtils extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class EventTag extends StatelessWidget {
  const EventTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
