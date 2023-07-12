import 'package:http/http.dart' as http;
import '../models/events.dart';

Future<Event> getEventsFromApi() async {
  final url = 'https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=&facet=date_start&facet=date_end&facet=tags&facet=address_name&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf&facet=transport&facet=price_type&facet=access_type&facet=updated_at&facet=programs';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = response.body;
    print(json);
    return eventFromJson(json);
  } else {
    throw Exception('Failed to fetch events');
  }
}
