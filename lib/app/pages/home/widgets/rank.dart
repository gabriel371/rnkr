import 'package:flutter/material.dart';

import '../../../data/models/item_model.dart';
import '../../../data/models/rank_model.dart';
import '../../../data/models/ranking_model.dart';
import '../../../global/constants.dart';
import 'edit_rank_dialog.dart';
import 'item.dart';

class Rank extends StatefulWidget {
  final RankModel rank;
  final RankingModel ranking;
  final ValueChanged<RankModel> delete;

  const Rank({
    Key? key,
    required this.rank,
    required this.ranking,
    required this.delete,
  }) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  void _editRank(RankModel editedRank) {
    setState(() {
      widget.rank.name = editedRank.name;
      widget.rank.color = editedRank.color;
    });
  }

  _showEditRankDialog(RankModel rank) {
    showDialog(
      context: context,
      builder: (_) {
        return EditRankDialog(
          ranking: widget.ranking,
          rank: rank,
          update: _editRank,
          delete: widget.delete,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _showEditRankDialog(widget.rank);
      },
      child: Container(
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
                  color: widget.rank.color,
                  border: const Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.rank.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline2!.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: DragTarget(
                builder: (context, acceptData, rejectData) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: (defaultPadding / 2)),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.rank.items?.length,
                      itemBuilder: (context, i) {
                        return Item(
                          size: 55.0,
                          item: widget.rank.items![i],
                        );
                      },
                    ),
                  );
                },
                onLeave: (item) => widget.rank.items?.remove(item),
                onWillAccept: (_) => true,
                onAccept: (ItemModel item) {
                  if (!widget.rank.items!.contains(item)) {
                    widget.rank.items?.add(item);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
