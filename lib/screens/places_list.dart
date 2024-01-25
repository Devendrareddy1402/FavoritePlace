import 'package:favorite_place/providers/user_places.dart';
import 'package:favorite_place/screens/add_place.dart';
import 'package:favorite_place/widgets/places_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(context, WidgetRef ref) {
    final userPlace = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Place',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPlaceScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(
        places: userPlace,
      ),
    );
  }
}
