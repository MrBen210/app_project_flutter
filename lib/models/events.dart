import 'dart:convert';

import 'dart:convert';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String startDate;
  final String endDate;
  final List<String> tags;
  final String addressName;
  final String addressZipCode;
  final String addressCity;
  final bool pmr;
  final bool blind;
  final bool deaf;
  final String transport;
  final String priceType;
  final String accessType;
  final String updatedAt;
  final String programs;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.tags,
    required this.addressName,
    required this.addressZipCode,
    required this.addressCity,
    required this.pmr,
    required this.blind,
    required this.deaf,
    required this.transport,
    required this.priceType,
    required this.accessType,
    required this.updatedAt,
    required this.programs,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['recordid'],
      title: json['fields']['title'],
      description: json['fields']['description'],
      imageUrl: json['fields']['imageurl'],
      startDate: json['fields']['date_start'],
      endDate: json['fields']['date_end'],
      tags: List<String>.from(json['fields']['tags']),
      addressName: json['fields']['address_name'],
      addressZipCode: json['fields']['address_zipcode'],
      addressCity: json['fields']['address_city'],
      pmr: json['fields']['pmr'],
      blind: json['fields']['blind'],
      deaf: json['fields']['deaf'],
      transport: json['fields']['transport'],
      priceType: json['fields']['price_type'],
      accessType: json['fields']['access_type'],
      updatedAt: json['fields']['updated_at'],
      programs: json['fields']['programs'],
    );
  }
}
