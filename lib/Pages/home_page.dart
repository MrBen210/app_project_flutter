import 'package:flutter/material.dart';
import 'package:app_project_flutter/services/event_api.dart';
import 'package:app_project_flutter/models/events.dart';
import 'package:app_project_flutter/widgets/events_grid.dart';

import '../Utils/hepers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Event>> _eventsFuture;
  EventSort _selectedSort = EventSort.defaultSort;
  PriceFilter _selectedPriceFilter = PriceFilter.all;

  @override
  void initState() {
    super.initState();
    _eventsFuture = getEventsFromApi(sort: _selectedSort, priceFilter: _selectedPriceFilter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParisEvenementHomePage'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<dynamic>(
            icon: const Icon(Icons.filter_list),
            offset: const Offset(0, 100),
            onSelected: (dynamic selectedFilter) {
              if (selectedFilter is EventSort && selectedFilter != _selectedSort) {
                setState(() {
                  _selectedSort = selectedFilter;
                  _eventsFuture = getEventsFromApi(sort: _selectedSort, priceFilter: _selectedPriceFilter);
                  print('Event Sort: $_selectedSort');
                });
              } else if (selectedFilter is PriceFilter && selectedFilter != _selectedPriceFilter) {
                setState(() {
                  _selectedPriceFilter = selectedFilter;
                  _eventsFuture = getEventsFromApi(sort: _selectedSort, priceFilter: _selectedPriceFilter);
                  print('Price Filter: $_selectedPriceFilter');
                });
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<EventSort>(
                value: EventSort.defaultSort,
                child: Text('Par défaut'),
              ),
              const PopupMenuItem<EventSort>(
                value: EventSort.title,
                child: Text('Par titre'),
              ),
              const PopupMenuItem<EventSort>(
                value: EventSort.startDate,
                child: Text('Par date de début'),
              ),
              const PopupMenuItem<EventSort>(
                value: EventSort.endDate,
                child: Text('Par date de fin'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<PriceFilter>(
                value: PriceFilter.all,
                child: Text('Tous les prix'),
              ),
              const PopupMenuItem<PriceFilter>(
                value: PriceFilter.free,
                child: Text('Gratuit'),
              ),
              const PopupMenuItem<PriceFilter>(
                value: PriceFilter.paid,
                child: Text('Payant'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder<List<Event>>(
          future: _eventsFuture,
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
        ),
      ),
    );
  }
}
