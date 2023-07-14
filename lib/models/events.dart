import 'dart:ffi';

class EventModel {
  final Int recordid;
  final String title;
  final String description;
  final String imageUrl;
  final String startDate;
  final String endDate;
  final String transport;
  final String priceType;
  final String accessType;
  final String programs;

  EventModel({
    required this.recordid,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.transport,
    required this.priceType,
    required this.accessType,
    required this.programs,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    final fields = json['fields'];

    print('Id: ${json['recordid']}');
    print('Title: ${fields?['title']}');
    print('Description: ${fields?['description']}');
    print('Image URL: ${fields?['imageurl']}');
    print('Start Date: ${fields?['date_start']}');
    print('End Date: ${fields?['date_end']}');
    print('Transport: ${fields?['transport']}');
    print('Price Type: ${fields?['price_type']}');
    print('Access Type: ${fields?['access_type']}');
    print('Programs: ${fields?['programs']}');

    return EventModel(
      recordid: json['recordid'],
      title: fields?['title'] ?? 'Title not available',
      description: fields?['description'] ?? 'Description not available',
      imageUrl: fields?['imageurl'] ?? 'No image',
      startDate: fields?['date_start'] ?? 'Start date not available',
      endDate: fields?['date_end'] ?? 'End date not available',
      transport: fields?['transport'] ?? 'Transport not available',
      priceType: fields?['price_type'] ?? 'Price type not available',
      accessType: fields?['access_type'] ?? 'Access type not available',
      programs: fields?['programs'] ?? 'Programs not available',
    );
  }

}
