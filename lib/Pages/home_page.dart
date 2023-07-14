import 'package:flutter/material.dart';
import 'package:app_project_flutter/services/event_api.dart';
import 'package:app_project_flutter/models/events.dart';
import 'package:app_project_flutter/Widgets/events_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<EventModel>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _eventsFuture = getEventsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParisEvenementHomePage'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List<EventModel>>(
          future: _eventsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<EventModel>? events = snapshot.data;
              print('Events data received: $events'); // Print the events data received
              return EventsGrid(events: events!);
            } else {
              return Center(child: Text('Aucun événement trouvé.'));
            }
          },
        ),
      ),
    );
  }
}
