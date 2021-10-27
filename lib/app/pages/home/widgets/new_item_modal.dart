import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rnkr/app/data/models/item_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class NewItemModel extends StatefulWidget {
  final RankingModel ranking;
  const NewItemModel({Key? key, required this.ranking}) : super(key: key);

  @override
  _NewItemModelState createState() => _NewItemModelState();
}

class _NewItemModelState extends State<NewItemModel> {
  final _itemNameController = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future _getImage() async {
    await _picker.pickImage(source: ImageSource.gallery).then((file) {
      setState(() {
        _imageFile = File(file!.path);
      });
    });
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
                                      widget.ranking.items!.add(
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
  }
}
