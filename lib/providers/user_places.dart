import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersPlaceNotifier extends StateNotifier<List<Place>> {
  UsersPlaceNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UsersPlaceNotifier, List<Place>>(
  (ref) => UsersPlaceNotifier(),
);
