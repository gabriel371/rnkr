import 'package:flutter/material.dart';

import '../../../data/models/item_model.dart';
import '../../../global/constants.dart';

class Item extends StatelessWidget {
  final double size;
  final ItemModel item;

  const Item({
    Key? key,
    this.size = 70.0,
    required this.item,
  }) : super(key: key);

  Widget _imageGetter() {
    if (item.imageFile != null) {
      return Image.file(
        item.imageFile!,
        fit: BoxFit.fill,
      );
    } else if (item.photoUrl != null) {
      return Image.network(
        item.photoUrl!,
        fit: BoxFit.fill,
      );
    } else {
      return Icon(
        Icons.image_not_supported,
        color: Colors.black,
        size: size / 1.5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<ItemModel>(
      rootOverlay: true,
      affinity: Axis.vertical,
      data: item,
      feedback: Container(
        margin: const EdgeInsets.only(
          top: defaultPadding,
          left: (defaultPadding / 8),
          right: (defaultPadding / 8),
          bottom: (defaultPadding / 4),
        ),
        height: size * 1.25,
        width: size * 1.25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.0),
          child: _imageGetter(),
        ),
      ),
      child: SizedBox(
        width: size * 1.5,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: defaultPadding,
                left: (defaultPadding / 4),
                right: (defaultPadding / 4),
                bottom: (defaultPadding / 4),
              ),
              height: size,
              width: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: _imageGetter(),
              ),
            ),
            Text(
              item.name.toString(),
              maxLines: 2,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
