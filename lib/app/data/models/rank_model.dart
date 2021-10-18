import 'package:flutter/material.dart';

import 'item_model.dart';

class RankModel {
  String name;
  int position;
  Color color;
  List<ItemModel>? items;

  RankModel({
    required this.name,
    required this.position,
    required this.color,
    this.items,
  });
}