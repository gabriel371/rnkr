import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/models/ranking_model.dart';

class CaptureDialog extends StatefulWidget {
  final RankingModel ranking;
  final Uint8List capturedImage;
  const CaptureDialog({
    Key? key,
    required this.ranking,
    required this.capturedImage,
  }) : super(key: key);

  @override
  State<CaptureDialog> createState() => _CaptureDialogState();
}

class _CaptureDialogState extends State<CaptureDialog> {
  void _saveFile(Uint8List file) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    String fileName =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}_${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}.jpg';
    print(dir.path + fileName);
    File(dir.path + fileName).writeAsBytesSync(file);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.ranking.name,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Column(
                  children: const [
                    Icon(Icons.close),
                    SizedBox(height: 5.0),
                    Text('Cancel'),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Column(
                  children: const [
                    Icon(Icons.save),
                    SizedBox(height: 5.0),
                    Text('Save'),
                  ],
                ),
                onTap: () {
                  _saveFile(widget.capturedImage);
                },
              ),
            ],
          ),
        ),
      ],
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: FittedBox(
          child: Image.memory(
            widget.capturedImage,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
