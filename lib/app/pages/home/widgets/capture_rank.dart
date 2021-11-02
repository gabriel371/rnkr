import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/rank_model.dart';
import '../../../data/models/ranking_model.dart';
import '../../../global/constants.dart';
import 'capture_item.dart';

class CaptureRank extends StatefulWidget {
  final RankModel rank;
  final RankingModel ranking;

  const CaptureRank({
    Key? key,
    required this.rank,
    required this.ranking,
  }) : super(key: key);

  @override
  State<CaptureRank> createState() => _CaptureRankState();
}

class _CaptureRankState extends State<CaptureRank> {
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
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline2!.color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(color: Colors.blueGrey[800]),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: (defaultPadding / 2)),
                scrollDirection: Axis.horizontal,
                itemCount: widget.rank.items?.length,
                itemBuilder: (context, i) {
                  return CaptureItem(
                    size: 55.0,
                    item: widget.rank.items![i],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
