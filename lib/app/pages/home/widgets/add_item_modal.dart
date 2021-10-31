import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rnkr/app/data/models/item_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';

class AddItemModal extends StatefulWidget {
  final RankingModel ranking;
  final ValueChanged<ItemModel> update;
  const AddItemModal({
    Key? key,
    required this.ranking,
    required this.update,
  }) : super(key: key);

  @override
  _AddItemModalState createState() => _AddItemModalState();
}

class _AddItemModalState extends State<AddItemModal> {
  final _itemNameController = TextEditingController();
  final _itemPhotoUrlController = TextEditingController();
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
                                  autofocus: false,
                                  controller: _itemNameController,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  textCapitalization: TextCapitalization.words,
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
                                    label: const Text('Item name'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _itemPhotoUrlController,
                              enabled: (_imageFile == null),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
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
                                label: const Text('Image URL'),
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
                                    widget.update(
                                      ItemModel(
                                        name: _itemNameController.text,
                                        imageFile: _imageFile,
                                        photoUrl: _imageFile == null
                                            ? _itemPhotoUrlController.text
                                            : null,
                                      ),
                                    );
                                    setState(() {
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
