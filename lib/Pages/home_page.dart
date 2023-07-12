import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import '../models/events.dart';
import '../services/event_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Event>(
      future: getEventsFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error loading events"),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Event"),
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
              child: Container(
                color: backgroundColor,
              ),
            ),
          );
        }
      },
    );
  }
}

