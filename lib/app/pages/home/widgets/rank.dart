import 'package:flutter/material.dart';

import '../../../data/models/item_model.dart';
import '../../../data/models/rank_model.dart';
import '../../../global/constants.dart';
import 'item.dart';

class Rank extends StatelessWidget {
  final RankModel rank;

  const Rank({Key? key, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: rank.color,
                border: const Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Center(
                child: Text(rank.name),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: DragTarget(
              builder: (context, acceptData, rejectData) {
                return ListView.builder(
                  padding: const EdgeInsets.only(top: (defaultPadding / 2)),
                  scrollDirection: Axis.horizontal,
                  itemCount: rank.items?.length,
                  itemBuilder: (context, i) {
                    return Item(
                      size: 55.0,
                      item: rank.items![i],
                    );
                  },
                );
              },
              onLeave: (item) => rank.items?.remove(item),
              onWillAccept: (_) => true,
              onAccept: (ItemModel item) {
                print(item.name);
                if (!rank.items!.contains(item)) {
                  rank.items?.add(item);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
