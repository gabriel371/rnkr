import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rnkr/app/data/models/rank_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class NewRankModal extends StatefulWidget {
  final RankingModel ranking;
  const NewRankModal({
    Key? key,
    required this.ranking,
  }) : super(key: key);

  @override
  _NewRankModalState createState() => _NewRankModalState();
}

class _NewRankModalState extends State<NewRankModal> {
  final _rankNameController = TextEditingController();

  Color pickerColor = const Color(0xFF00FF00);

  void _changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        height: 500.0,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
        ),
        child: Column(
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
                  color: Colors.grey[800],
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
                children: [
                  ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: _changeColor,
                    paletteType: PaletteType.rgb,
                    pickerAreaHeightPercent: 0.0,
                    enableAlpha: false,
                    showLabel: false,
                    portraitOnly: true,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 8,
                        child: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: _rankNameController,
                          builder: (context, value, _) {
                            return TextFormField(
                              controller: _rankNameController,
                              decoration: InputDecoration(
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
                          valueListenable: _rankNameController,
                          builder: (context, value, _) {
                            return TextButton(
                              child: const Text('Add'),
                              onPressed: value.text.isEmpty
                                  ? null
                                  : () {
                                      setState(() {
                                        widget.ranking.ranks!.add(
                                          RankModel(
                                            color: pickerColor,
                                            name: _rankNameController.text,
                                            items: [],
                                          ),
                                        );
                                        _rankNameController.clear();
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