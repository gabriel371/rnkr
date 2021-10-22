import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../data/models/item_model.dart';
import '../../data/models/rank_model.dart';
import '../../data/models/ranking_model.dart';
import '../../global/constants.dart';
import '../../pages/home/widgets/item.dart';
import '../../pages/home/widgets/rank.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Just a temporary example
  RankingModel ranking = RankingModel(
    name: 'New Ranking',
    ranks: [],
    items: [
      ItemModel(
        name: 'Item 1',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 2',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 3',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 4',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 5',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 6',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 7',
        repeatable: false,
      ),
      ItemModel(
        name: 'Item 8',
        repeatable: false,
      ),
    ],
  );

  final _rankNameController = TextEditingController();

  Color pickerColor = const Color(0xFF00FF00);
  Color currentColor = const Color(0xFF00FF00);

  void _changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
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
                            child: TextFormField(
                              controller: _rankNameController,
                              decoration: const InputDecoration(
                                label: Text('Name'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              child: const Text('Add'),
                              onPressed: () {
                                setState(() {
                                  ranking.ranks!.add(
                                    RankModel(
                                      color: pickerColor,
                                      name: _rankNameController.text,
                                      items: [],
                                    ),
                                  );
                                  _rankNameController.clear();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 5.0,
                  ),
                  child: Text(
                    'New Item',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.photo,
                                  size: 60.0,
                                ),
                                Text('Add Image'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Name'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Add'),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: (defaultPadding / 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ranking.name,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.add,
                            size: 40.0,
                          ),
                          onTap: () {
                            _showAddOptions(context);
                          },
                        ),
                        const SizedBox(width: (defaultPadding / 2)),
                        GestureDetector(
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 40.0,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: (defaultPadding / 2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            offset: Offset(2.0, 2.0),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                        ),
                        child: ReorderableListView(
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (oldIndex < newIndex) {
                                newIndex -= 1;
                              }
                              final RankModel rank =
                                  ranking.ranks!.removeAt(oldIndex);
                              ranking.ranks!.insert(newIndex, rank);
                            });
                          },
                          children: [
                            ...ranking.ranks!
                                .map(
                                  (rank) => GestureDetector(
                                    key: ValueKey(rank),
                                    onDoubleTap: () {
                                      // TODO: Implement logic to edit rank
                                    },
                                    child: Rank(
                                      key: ValueKey(rank),
                                      rank: rank,
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: (defaultPadding / 2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            offset: Offset(-2.0, 2.0),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                        ),
                        child: DragTarget(
                          builder: (context, acceptData, rejectData) {
                            return ListView(
                              children: [
                                ...ranking.items!
                                    .map(
                                      (item) => GestureDetector(
                                        child: Item(item: item),
                                        onDoubleTap: () {
                                          // TODO: Implement logic to edit item
                                        },
                                      ),
                                    )
                                    .toList(),
                              ],
                            );
                          },
                          onLeave: (item) => ranking.items?.remove(item),
                          onAccept: (ItemModel item) {
                            if (!ranking.items!.contains(item)) {
                              ranking.items?.add(item);
                            }
                          },
                        ),
                      ),
                    ),
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
