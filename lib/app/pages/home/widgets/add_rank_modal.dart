import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../data/models/rank_model.dart';
import '../../../data/models/ranking_model.dart';

class AddRankModal extends StatefulWidget {
  final RankingModel ranking;
  final ValueChanged<RankModel> update;
  const AddRankModal({
    Key? key,
    required this.ranking,
    required this.update,
  }) : super(key: key);

  @override
  _AddRankModalState createState() => _AddRankModalState();
}

class _AddRankModalState extends State<AddRankModal> {
  final rankNameController = TextEditingController();

  Color pickerColor = const Color(0xFF00FF00);

  void _changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 15.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                height: 5.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
              child: Text(
                'New Rank',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'Color',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: _changeColor,
                          paletteType: PaletteType.rgb,
                          pickerAreaHeightPercent: 0.0,
                          enableAlpha: false,
                          showLabel: false,
                          portraitOnly: true,
                        ),
                      ),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 8,
                        child: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: rankNameController,
                          builder: (context, value, _) {
                            return TextFormField(
                              autofocus: false,
                              controller: rankNameController,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                                errorText: value.text.isEmpty
                                    ? 'Must have at least one character!'
                                    : null,
                                label: const Text('Name'),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: rankNameController,
                          builder: (context, value, _) {
                            return TextButton(
                              child: const Text('Add'),
                              onPressed: value.text.isEmpty
                                  ? null
                                  : () {
                                      widget.update(
                                        RankModel(
                                          name: rankNameController.text,
                                          color: pickerColor,
                                          items: [],
                                        ),
                                      );
                                      setState(() {
                                        rankNameController.clear();
                                      });
                                    },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
