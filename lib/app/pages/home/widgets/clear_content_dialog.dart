import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class ClearContentDialog extends StatelessWidget {
  final RankingModel ranking;
  final VoidCallback clearItems;
  final VoidCallback clearRanks;
  final VoidCallback clearAll;
  const ClearContentDialog({
    Key? key,
    required this.ranking,
    required this.clearItems,
    required this.clearRanks,
    required this.clearAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Warning!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ),
      ),
      content: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Text(
            'This will erase all data!',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            child: Text(
              'Clear Items!',
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
            onPressed: clearItems,
          ),
        ),
        Center(
          child: TextButton(
            child: Text(
              'Clear Ranks!',
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
            onPressed: clearRanks,
          ),
        ),
        Center(
          child: TextButton(
            child: Text(
              'Clear All!',
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
            onPressed: clearAll,
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
