import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_project_flutter/models/events.dart';

Future<List<EventModel>> getEventsFromApi() async {
  final url = 'https://data.opendatasoft.com/api/records/1.0/search/?dataset=que-faire-a-paris-%40parisdata&q=&rows=2000&facet=recordid&facet=title&facet=description&facet=imageUrl&facet=startDate&facet=endDate&facet=transport&facet=priceType&facet=accessType&facet=programs';

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    if (json.containsKey('records') && json['records'] != null) {
      var eventRecords = json['records'];

      print("print avant entré dans la boucle for");
      print(json);
      print(eventRecords);

      List<EventModel> events = [];

      for (var record in eventRecords) {
        var eventJson = record['fields'];

        print("print de eventJson ");
        print(eventJson);

        if (eventJson.containsKey('imageurl') &&
            eventJson['imageurl'] != null &&
            eventJson['imageurl'].isNotEmpty) {
          EventModel event = EventModel.fromJson(eventJson);
          events.add(event);
          print('tableau events: $events');
          print('Added event: $event'); // Print the added event
        }
      }

      print('Events data: $events'); // Print the events data
      print(events.length);
      return events;
    } else {
      print('aucune date');
      return [];
    }
  } else {
    return [];
  }
}
