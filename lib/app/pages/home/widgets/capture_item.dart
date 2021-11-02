import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/item_model.dart';
import '../../../global/constants.dart';

class CaptureItem extends StatelessWidget {
  final double size;
  final ItemModel item;

  const CaptureItem({
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
    return SizedBox(
      width: size * 1.2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: defaultPadding,
              left: (defaultPadding / 8),
              right: (defaultPadding / 8),
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
            style: GoogleFonts.lato(),
          ),
        ],
      ),
    );
  }
}
