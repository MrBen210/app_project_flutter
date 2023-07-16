import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';

class EventsGrid extends StatelessWidget {
  final List<Event> events;

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

  const _EventTile({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Placeholder(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.60),
              height: 35,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

