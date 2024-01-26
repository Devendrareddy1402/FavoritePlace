import 'package:favorite_place/models/place.dart';
import 'package:favorite_place/providers/user_places.dart';
import 'package:favorite_place/widgets/image_input.dart';
import 'package:favorite_place/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});
  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  XFile? _choosenImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _choosenImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, _choosenImage!, _selectedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // Image Input
            ImageInput(
              onPickImage: (photo) {
                _choosenImage = photo;
              },
            ),

            const SizedBox(
              height: 16,
            ),

            //location
            LocationInput(
              onSelectedLocation: (location) {
                _selectedLocation = location;
              },
            ),

            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
