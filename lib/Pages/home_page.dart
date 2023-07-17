import 'package:flutter/material.dart';
import 'package:app_project_flutter/services/event_api.dart';
import 'package:app_project_flutter/models/events.dart';
import '../Utils/hepers.dart';
import '../Widgets/events_future_builder.dart';
import '../Widgets/popup_menu_button.dart';


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
          PopupMenuButtonWidget(
            selectedSort: _selectedSort,
            selectedPriceFilter: _selectedPriceFilter,
            onSelectedFilter: _onSelectedFilter,
          ),
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: EventsFutureBuilderWidget(
          eventsFuture: _eventsFuture,
        ),
      ),
    );
  }

  void _onSelectedFilter(dynamic selectedFilter) {
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
  }
}
