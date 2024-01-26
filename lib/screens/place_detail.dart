import 'package:cross_file_image/cross_file_image.dart';
import 'package:favorite_place/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.place});
  final Place place;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
        ),
      ),
      body: Stack(
        children: [
          Image(
            image: XFileImage(place.image),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
