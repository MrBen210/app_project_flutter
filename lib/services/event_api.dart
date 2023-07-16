import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_project_flutter/models/events.dart';

Future<List<Event>> getEventsFromApi() async {
  const url = 'https://data.opendatasoft.com/api/records/1.0/search/?dataset=que-faire-a-paris-%40parisdata&q=&rows=2000&facet=recordid&facet=title&facet=description&facet=imageUrl&facet=startDate&facet=endDate&facet=transport&facet=priceType&facet=accessType&facet=programs';

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    var eventRecords = json['records'];
    //print('Event records: $eventRecords');

    List<Event> events = [];

    for (var record in eventRecords) {
      Event event = Event.fromJson(record);
      events.add(event);
      //print('Event: $event');
    }

    print('Events data:');
    for (var event in events) {
      print(event);
    }
    print(events.length);
    return events;
  } else {
    return [];
  }
}
