import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/events.dart';

Future<List<EventModel>> getEventsFromApi() async {
  final url = 'https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=&facet=date_start&facet=date_end&facet=tags&facet=address_name&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf&facet=transport&facet=price_type&facet=access_type&facet=updated_at&facet=programs';

  final response = await http.get(Uri.parse(url), headers: {
    'apikey': '1c56fba90c2783b7950084f74eb04dced825f0099099d0aa2c3000e7',
  });

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    var records = jsonResponse["records"];

    if (records != null && records is List) {
      var eventList = records.map<EventModel>((record) {
        var fields = record["fields"];
        return EventModel.fromJson({
          'recordid': record["recordid"],
          'fields': {
            'title': fields["title"],
            'description': fields["description"],
            'imageurl': fields["imageurl"],
            'date_start': fields["date_start"],
            'date_end': fields["date_end"],
            'tags': fields["tags"],
            'address_name': fields["address_name"],
            'address_zipcode': fields["address_zipcode"],
            'address_city': fields["address_city"],
            'pmr': fields["pmr"],
            'blind': fields["blind"],
            'deaf': fields["deaf"],
            'transport': fields["transport"],
            'price_type': fields["price_type"],
            'access_type': fields["access_type"],
            'updated_at': fields["updated_at"],
            'programs': fields["programs"],
          },
        });
      }).toList();

      return eventList;
    } else {
      throw Exception('Failed to parse event records');
    }
  } else {
    throw Exception('Failed to fetch events');
  }
}

