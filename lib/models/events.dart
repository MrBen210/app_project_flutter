
class Event {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['recordid'] as String,
      title: json['fields']['title'] as String? ?? '',
      imageUrl: json['fields']['cover_url'] as String? ?? '',
      description: json['fields']['description'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'Event{id: $id, title: $title, imageUrl: $imageUrl, description: $description}';
  }
}
