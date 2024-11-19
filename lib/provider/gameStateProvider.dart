import 'package:flipnpair/util/imagepaths.dart';
import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  List<String> _images = [];

  List<String> get images => _images;

  void generateImages(int gridSize) {
    // Generate and shuffle the images
    int uniqueImageCount = gridSize ~/ 2;
    final List<String> selectedImages = imagePaths.sublist(0, uniqueImageCount);

    _images = [...selectedImages, ...selectedImages];
    _images.shuffle();

    // Notify listeners to rebuild the UI
    notifyListeners();
  }
}
