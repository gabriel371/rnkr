import 'package:flutter/material.dart';

import '../../../global/constants.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding / 8,
            right: defaultPadding / 8,
            bottom: defaultPadding / 4,
          ),
          height: 70.0,
          width: 70.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 40.0,
            ),
          ),
        ),
        const Text('Add new item'),
      ],
    );
  }
}
