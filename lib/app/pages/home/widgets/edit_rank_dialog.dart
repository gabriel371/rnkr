import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:rnkr/app/data/models/rank_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class EditRankDialog extends StatefulWidget {
  final RankingModel ranking;
  final RankModel rank;
  final ValueChanged<RankModel> update;
  final ValueChanged<RankModel> delete;
  const EditRankDialog({
    Key? key,
    required this.ranking,
    required this.rank,
    required this.update,
    required this.delete,
  }) : super(key: key);

  @override
  _EditRankDialogState createState() => _EditRankDialogState();
}

class _EditRankDialogState extends State<EditRankDialog> {
  @override
  Widget build(BuildContext context) {
    Color rankColor = widget.rank.color;

    void changeColor(Color color) => rankColor = color;

    final editRankNameController = TextEditingController(
      text: widget.rank.name,
    );

    return AlertDialog(
      title: Text('Edit ' + widget.rank.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(
            pickerColor: rankColor,
            onColorChanged: changeColor,
            paletteType: PaletteType.rgb,
            pickerAreaHeightPercent: 0.0,
            enableAlpha: false,
            showLabel: false,
            portraitOnly: true,
          ),
          // TODO: Implement switch to choose between light and dark title
          ValueListenableBuilder<TextEditingValue>(
              valueListenable: editRankNameController,
              builder: (_, value, __) {
                return TextFormField(
                  controller: editRankNameController,
                  decoration: InputDecoration(
                    errorText: value.text.isEmpty
                        ? 'Name should not stay empty!'
                        : null,
                    label: const Text('Name'),
                  ),
                );
              }),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text(
            'Delete',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            widget.delete(widget.rank);
            Navigator.pop(context);
          },
        ),
        ValueListenableBuilder<TextEditingValue>(
            valueListenable: editRankNameController,
            builder: (_, value, __) {
              return ElevatedButton(
                child: const Text('Ok'),
                onPressed: value.text.isEmpty
                    ? null
                    : () {
                        widget.update(
                          RankModel(
                            name: editRankNameController.text,
                            color: rankColor,
                            items: widget.rank.items,
                          ),
                        );
                        Navigator.pop(context);
                      },
              );
            }),
      ],
    );
  }
}
