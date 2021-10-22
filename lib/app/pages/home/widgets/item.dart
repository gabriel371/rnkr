import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/item_model.dart';
import 'package:rnkr/app/global/constants.dart';

class Item extends StatelessWidget {
  final double? size;
  final ItemModel? item;

  const Item({
    Key? key,
    this.size = 70.0,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<ItemModel>(
      rootOverlay: true,
      affinity: Axis.vertical,
      data: item,
      feedback: Container(
        margin: const EdgeInsets.only(
          top: defaultPadding,
          left: (defaultPadding / 8),
          right: (defaultPadding / 8),
          bottom: (defaultPadding / 4),
        ),
        height: size! * 1.25,
        width: size! * 1.25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: defaultPadding,
              left: (defaultPadding / 8),
              right: (defaultPadding / 8),
              bottom: (defaultPadding / 4),
            ),
            height: size,
            width: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
          ),
          Text(item!.name.toString()),
        ],
      ),
    );
  }
}
