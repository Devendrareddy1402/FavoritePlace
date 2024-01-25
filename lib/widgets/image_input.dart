import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});
  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  XFile? _selectedImage;

  void _takePicture() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: double.infinity,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = pickedImage;
    });
  }

  @override
  Widget build(context) {
    Widget content = ElevatedButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera_alt_rounded),
      label: const Text('Add Image'),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          File(_selectedImage!.path),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      )),
      child: content,
    );
  }
}
