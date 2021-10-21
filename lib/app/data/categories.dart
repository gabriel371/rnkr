import 'package:flutter/material.dart';

import 'models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    colors: [
      '0xFFADFF00',
      '0xFF649300',
    ],
    icon: 'sports_soccer_outlined',
    name: 'Esportes',
  ),
  CategoryModel(
    colors: [
      '0xFFFF0F00',
      '0xFF930000',
    ],
    icon: 'restaurant',
    name: 'Comidas',
  ),
  CategoryModel(
    colors: [
      '0xFF0066FF',
      '0xFF007893',
    ],
    icon: Icons.music_note,
    name: 'Músicas',
  ),
  CategoryModel(
    colors: [
      '0xFF8000FF',
      '0xFF93008D',
    ],
    icon: Icons.sell_outlined,
    name: 'Roupas',
  ),
  CategoryModel(
    colors: [
      '0xFFFFC700',
      '0xFF933500',
    ],
    icon: Icons.location_city,
    name: 'Lugares',
  ),
];
