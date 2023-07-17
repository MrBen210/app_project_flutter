import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Utils/hepers.dart';
import '../models/events.dart';

Future<List<Event>> getEventsFromApi({EventSort sort = EventSort.defaultSort, PriceFilter priceFilter = PriceFilter.all}) async {
  final baseUrl = 'https://data.opendatasoft.com/api/records/1.0/search/';
  final dataset = 'que-faire-a-paris-%40parisdata';
  final defaultQueryParams =
      '?dataset=$dataset&q=&rows=200&facet=date_start&facet=date_end&facet=tags&facet=address_name&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf&facet=transport&facet=price_type&facet=access_type&facet=updated_at&facet=programs';

  String sortQueryParam;
  switch (sort) {
    case EventSort.defaultSort:
      sortQueryParam = '';
      break;
    case EventSort.title:
      sortQueryParam = 'sort=-fields.title';
      break;
    case EventSort.startDate:
      sortQueryParam = 'sort=fields.date_start';
      break;
    case EventSort.endDate:
      sortQueryParam = 'sort=fields.date_end';
      break;
    default:
      sortQueryParam = '';
  }

  String priceFilterQueryParam;
  switch (priceFilter) {
    case PriceFilter.all:
      priceFilterQueryParam = '';
      break;
    case PriceFilter.free:
      priceFilterQueryParam = '&refine.fields.price_type=gratuit';
      break;
    case PriceFilter.paid:
      priceFilterQueryParam = '&refine.fields.price_type!=gratuit';
      break;
    default:
      priceFilterQueryParam = '';
  }

  final url = Uri.parse('$baseUrl$defaultQueryParams$sortQueryParam$priceFilterQueryParam');

  print('//////////////////////////////////////////////////////////////////////');
  print('//////////////////////////////////////////////////////////////////////');
  print('url :');
  print(url);
  print('//////////////////////////////////////////////////////////////////////');
  print('//////////////////////////////////////////////////////////////////////');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final eventRecords = json['records'];

    final events = <Event>[];
    for (var record in eventRecords) {
      final event = Event.fromJson(record);
      events.add(event);
    }
    return events;
  } else {
    return [];
  }
}
