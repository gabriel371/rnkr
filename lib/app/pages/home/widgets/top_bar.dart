import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';
import 'package:rnkr/app/global/constants.dart';

import 'edit_ranking_name_dialog.dart';
import 'help_dialog.dart';

class TopBar extends StatefulWidget {
  final RankingModel ranking;
  const TopBar({Key? key, required this.ranking}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  void _editRankingName(String name) {
    setState(() => widget.ranking.name = name);
  }

  _showHelpDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return HelpDialog(context: context);
      },
    );
  }

  _showEditRankingNameDialog(RankingModel ranking) {
    showDialog(
      context: context,
      builder: (_) {
        return EditRankingNameDialog(
          ranking: ranking,
          update: _editRankingName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: (defaultPadding / 2),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 15,
            child: GestureDetector(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: Text(
                  widget.ranking.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onDoubleTap: () {
                _showEditRankingNameDialog(widget.ranking);
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.help_outline,
                    size: 40.0,
                  ),
                  onTap: () {
                    _showHelpDialog();
                  },
                ),
                const SizedBox(width: (defaultPadding / 1.5)),
                GestureDetector(
                  child: const Icon(
                    Icons.check,
                    size: 40.0,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
