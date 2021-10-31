import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/rank_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';
import 'package:rnkr/app/global/constants.dart';

import 'rank.dart';

class RankList extends StatefulWidget {
  final RankingModel ranking;
  const RankList({Key? key, required this.ranking}) : super(key: key);

  @override
  _RankListState createState() => _RankListState();
}

class _RankListState extends State<RankList> {
  void _deleteRank(RankModel rank) {
    setState(() => widget.ranking.ranks!.remove(rank));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: (defaultPadding / 2),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: const Offset(2.0, 2.0),
            color: Theme.of(context).shadowColor,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
        ),
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final RankModel rank = widget.ranking.ranks!.removeAt(oldIndex);
              widget.ranking.ranks!.insert(newIndex, rank);
            });
          },
          children: [
            ...widget.ranking.ranks!
                .map(
                  (rank) => Rank(
                    key: ValueKey(rank),
                    ranking: widget.ranking,
                    rank: rank,
                    delete: _deleteRank,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
