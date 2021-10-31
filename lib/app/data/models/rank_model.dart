import 'package:flutter/material.dart';

import 'item_model.dart';

class RankModel {
  String name;
  Color color;
  List<ItemModel>? items;

  RankModel({
    required this.name,
    required this.color,
    this.items,
  });
}
