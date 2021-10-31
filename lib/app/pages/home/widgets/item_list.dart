import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/item_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';
import 'package:rnkr/app/global/constants.dart';

import 'item.dart';

class ItemList extends StatefulWidget {
  final RankingModel ranking;
  const ItemList({Key? key, required this.ranking}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: (defaultPadding / 2),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            offset: Offset(-2.0, 2.0),
            color: Colors.grey,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
        ),
        child: DragTarget(
          builder: (context, acceptData, rejectData) {
            return ListView(
              children: [
                ...widget.ranking.items!
                    .map(
                      (item) => Item(item: item),
                    )
                    .toList(),
              ],
            );
          },
          onLeave: (item) => widget.ranking.items?.remove(item),
          onAccept: (ItemModel item) {
            if (!widget.ranking.items!.contains(item)) {
              widget.ranking.items?.add(item);
            }
          },
        ),
      ),
    );
  }
}
