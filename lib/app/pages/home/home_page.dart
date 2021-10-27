import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    name: 'Double tap me to edit',
    ranks: [],
    items: [
      ItemModel(
        name: 'Vasco',
        photoUrl: 'https://a.espncdn.com/i/teamlogos/soccer/500/3454.png',
      ),
      // ItemModel(name: 'Item 2'),
      // ItemModel(name: 'Item 3'),
      // ItemModel(name: 'Item 4'),
      // ItemModel(name: 'Item 5'),
      // ItemModel(name: 'Item 6'),
      // ItemModel(name: 'Item 7'),
      // ItemModel(name: 'Item 8'),
    ],
  );

  final _rankNameController = TextEditingController();
  final _itemNameController = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Color pickerColor = const Color(0xFF00FF00);

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void _changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  _showAddRankModal() {
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
      },
    );
  }

  _showAddItemModal() {
    Future _getImage() async {
      await _picker.pickImage(source: ImageSource.gallery).then((file) {
        setState(() {
          _imageFile = File(file!.path);
        });
      });
    }

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
                            child: GestureDetector(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.photo,
                                    size: 60.0,
                                  ),
                                  Text('Upload Image'),
                                ],
                              ),
                              onTap: () {
                                _getImage();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ValueListenableBuilder<TextEditingValue>(
                                  valueListenable: _itemNameController,
                                  builder: (context, value, _) {
                                    return TextFormField(
                                      controller: _itemNameController,
                                      decoration: InputDecoration(
                                        errorText: value.text.isEmpty
                                            ? 'Must have at least one character!'
                                            : null,
                                        label: const Text('Item name'),
                                      ),
                                    );
                                  },
                                ),
                                TextFormField(
                                  enabled: (_imageFile == null),
                                  decoration: const InputDecoration(
                                    label: Text('Image URL'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ValueListenableBuilder<TextEditingValue>(
                            valueListenable: _itemNameController,
                            builder: (context, value, _) {
                              return TextButton(
                                child: const Text('Add'),
                                onPressed: value.text.isEmpty
                                    ? null
                                    : () {
                                        setState(() {
                                          ranking.items!.add(
                                            ItemModel(
                                              name: _itemNameController.text,
                                              imageFile: _imageFile,
                                            ),
                                          );
                                          _imageFile = null;
                                          _itemNameController.clear();
                                        });
                                      },
                              );
                            },
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

  _showEditRankingNameDialog(BuildContext context, RankingModel ranking) {
    final _editRankingNameController = TextEditingController(
      text: ranking.name,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _editRankingNameController,
            builder: (context, value, _) {
              return TextFormField(
                controller: _editRankingNameController,
                maxLength: 40,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 20.0),
                  suffixIcon: IconButton(
                    iconSize: 25.0,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _editRankingNameController.text = '';
                      });
                    },
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
                          setState(() {
                            ranking.name = _editRankingNameController.text;
                          });
                          Navigator.pop(context);
                        },
                );
              },
            ),
          ],
        );
      },
    );
  }

  _showEditRankDialog(BuildContext context, RankModel rank) {
    final _editRankNameController = TextEditingController(text: rank.name);
    Color rankColor = rank.color;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit ' + rank.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: rankColor,
                onColorChanged: _changeColor,
                paletteType: PaletteType.rgb,
                pickerAreaHeightPercent: 0.0,
                enableAlpha: false,
                showLabel: false,
                portraitOnly: true,
              ),
              ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _editRankNameController,
                  builder: (context, value, _) {
                    return TextFormField(
                      controller: _editRankNameController,
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
                setState(() {
                  ranking.ranks?.remove(rank);
                });
                Navigator.pop(context);
              },
            ),
            ValueListenableBuilder<TextEditingValue>(
                valueListenable: _editRankNameController,
                builder: (context, value, _) {
                  return ElevatedButton(
                    child: const Text('Ok'),
                    onPressed: value.text.isEmpty
                        ? null
                        : () {
                            setState(() {
                              rank.color = pickerColor;
                              rank.name = _editRankNameController.text;
                            });
                            Navigator.pop(context);
                          },
                  );
                }),
          ],
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
                            ranking.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onDoubleTap: () {
                          _showEditRankingNameDialog(context, ranking);
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
                            onTap: () {},
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
                                      _showEditRankDialog(context, rank);
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
                                      (item) => Item(item: item),
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
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        overlayOpacity: 0.2,
        openCloseDial: isDialOpen,
        spaceBetweenChildren: 10.0,
        switchLabelPosition: true,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.menu),
            label: 'Add Rank',
            backgroundColor: Colors.grey[350],
            onTap: _showAddRankModal,
          ),
          SpeedDialChild(
            child: const Icon(Icons.adjust),
            label: 'Add Item',
            backgroundColor: Colors.grey[350],
            onTap: _showAddItemModal,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
