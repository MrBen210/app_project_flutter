import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';

class EventsGrid extends StatelessWidget {
  final List<EventModel> events;

  EventsGrid({required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var event in events)
          _EventTile(
            imageUrl: event.imageUrl,
            title: event.title,
          )
      ],
    );
  }
}

class _EventTile extends StatelessWidget {
  final String imageUrl;
  final String title;

  _EventTile({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    print('Event Title: $title'); // Print the event title
    print('Image URL: $imageUrl'); // Print the image URL

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Placeholder(), // Image par défaut ou Placeholder
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.6),
              height: 35,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

