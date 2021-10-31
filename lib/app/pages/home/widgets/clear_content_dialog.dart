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
      title: const Text(
        'Warning!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text('This will erase all data!'),
      actions: [
        TextButton(
          child: const Text(
            'Clear Items!',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: clearItems,
        ),
        TextButton(
          child: const Text(
            'Clear Ranks!',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: clearRanks,
        ),
        TextButton(
          child: const Text(
            'Clear All!',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: clearAll,
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
