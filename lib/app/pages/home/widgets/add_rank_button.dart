import 'package:flutter/material.dart';

class AddRankButton extends StatelessWidget {
  const AddRankButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 50.0,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Center(
              child: Text('Add new rank'),
            ),
          ),
        ],
      ),
    );
  }
}
