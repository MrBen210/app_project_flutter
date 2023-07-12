import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  int nhits;
  List<Record> records;

  Event({
    required this.nhits,
    required this.records,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    nhits: json["nhits"],
    records: List<Record>.from(
        json["records"].map((x) => Record.fromJson(x["fields"]))),
  );

  get fields => Fields();

  Map<String, dynamic> toJson() => {
    "nhits": nhits,
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  Fields fields;

  Record({
    required this.fields,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    fields: Fields.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "fields": fields.toJson(),
  };
}

class Fields {
  String? title;
  DateTime? dateStart;
  DateTime? dateEnd;
  String? priceType;
  String? addressName;
  ImageCouverture? imageCouverture;

  Fields({
    this.title,
    this.dateStart,
    this.dateEnd,
    this.priceType,
    this.addressName,
    this.imageCouverture,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    title: json["title"],
    dateStart: json["date_start"] == null
        ? null
        : DateTime.parse(json["date_start"]),
    dateEnd: json["date_end"] == null
        ? null
        : DateTime.parse(json["date_end"]),
    priceType: json["price_type"],
    addressName: json["address_name"],
    imageCouverture: json["image_couverture"] == null
        ? null
        : ImageCouverture.fromJson(json["image_couverture"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "date_start": dateStart?.toIso8601String(),
    "date_end": dateEnd?.toIso8601String(),
    "price_type": priceType,
    "address_name": addressName,
    "image_couverture": imageCouverture?.toJson(),
  };
}

class ImageCouverture {
  String? id;
  String? format;

  ImageCouverture({
    this.id,
    this.format,
  });

  factory ImageCouverture.fromJson(Map<String, dynamic> json) => ImageCouverture(
    id: json["id"],
    format: json["format"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "format": format,
  };
}
