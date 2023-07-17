import 'package:flutter/foundation.dart';

class Favorites extends ChangeNotifier {
  List<String> _favoriteEventIds = [];

  List<String> get favoriteEventIds => _favoriteEventIds;

  void addFavorite(String eventId) {
    _favoriteEventIds.add(eventId);
    notifyListeners();
  }

  void removeFavorite(String eventId) {
    _favoriteEventIds.remove(eventId);
    notifyListeners();
  }

  bool isFavorite(String eventId) {
    return _favoriteEventIds.contains(eventId);
  }
}
