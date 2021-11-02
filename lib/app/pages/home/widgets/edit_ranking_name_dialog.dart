import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class EditRankingNameDialog extends StatefulWidget {
  final RankingModel ranking;
  final ValueChanged<String> update;
  const EditRankingNameDialog({
    Key? key,
    required this.ranking,
    required this.update,
  }) : super(key: key);

  @override
  State<EditRankingNameDialog> createState() => _EditRankingNameDialogState();
}

class _EditRankingNameDialogState extends State<EditRankingNameDialog> {
  @override
  Widget build(BuildContext context) {
    final _editRankingNameController = TextEditingController(
      text: widget.ranking.name,
    );
    return AlertDialog(
      content: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _editRankingNameController,
        builder: (_, value, __) {
          return TextFormField(
            controller: _editRankingNameController,
            maxLength: 40,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              errorText:
                  value.text.isEmpty ? 'Name should not stay empty!' : null,
              label: const Text('List Name'),
            ),
          );
        },
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _editRankingNameController,
          builder: (context, value, _) {
            return ElevatedButton(
              child: const Text('Ok'),
              onPressed: value.text.isEmpty
                  ? null
                  : () {
                      widget.update(_editRankingNameController.text);
                      Navigator.pop(context);
                    },
            );
          },
        ),
      ],
    );
  }
}
