import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  IconData icon;
  List<Color> colors;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.colors,
  });
}