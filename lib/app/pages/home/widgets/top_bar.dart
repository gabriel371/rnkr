import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rnkr/app/pages/home/widgets/capture_list.dart';
import 'package:rnkr/app/pages/home/widgets/capture_dialog.dart';
import 'package:rnkr/app/pages/home/widgets/rank_list.dart';
import 'package:screenshot/screenshot.dart';

import '../../../data/models/ranking_model.dart';
import '../../../global/constants.dart';
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

  final ScreenshotController screenshotController = ScreenshotController();

  Future<dynamic> _showCaptureDialog(
    BuildContext context,
    RankingModel ranking,
    Uint8List image,
  ) {
    return showDialog(
      context: context,
      builder: (_) {
        return CaptureDialog(ranking: ranking, capturedImage: image);
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
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Theme.of(context).textTheme.headline1!.color,
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
                  child: Icon(
                    Icons.help_outline,
                    size: 40.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    _showHelpDialog();
                  },
                ),
                const SizedBox(width: (defaultPadding / 1.5)),
                GestureDetector(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 40.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    screenshotController
                        .captureFromWidget(
                      CaptureList(ranking: widget.ranking),
                      delay: const Duration(seconds: 1),
                    )
                        .then((image) async {
                      _showCaptureDialog(context, widget.ranking, image);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
