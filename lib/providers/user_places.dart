import 'package:favorite_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UsersPlaceNotifier extends StateNotifier<List<Place>> {
  UsersPlaceNotifier() : super(const []);

  void addPlace(String title , XFile image, PlaceLocation location) {
    final newPlace = Place(title: title,image: image,location: location);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UsersPlaceNotifier, List<Place>>(
  (ref) => UsersPlaceNotifier(),
);
