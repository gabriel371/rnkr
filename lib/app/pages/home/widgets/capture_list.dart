import 'package:flutter/material.dart';

import '../../../data/models/ranking_model.dart';
import '../../../global/constants.dart';
import 'capture_rank.dart';

class CaptureList extends StatefulWidget {
  final RankingModel ranking;
  const CaptureList({Key? key, required this.ranking}) : super(key: key);

  @override
  _CaptureListState createState() => _CaptureListState();
}

class _CaptureListState extends State<CaptureList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: (defaultPadding / 2)),
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: ListView(
        children: [
          ...widget.ranking.ranks!
              .map(
                (rank) => CaptureRank(
                  key: ValueKey(rank),
                  ranking: widget.ranking,
                  rank: rank,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
