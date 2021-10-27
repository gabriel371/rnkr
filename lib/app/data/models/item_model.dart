import 'dart:io';

class ItemModel {
  String name;
  String? photoUrl;
  File? imageFile;

  ItemModel({
    required this.name,
    this.photoUrl,
    this.imageFile,
  });
}
