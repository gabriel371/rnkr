import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rnkr/app/data/categories.dart';
import 'package:rnkr/app/data/models/category_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';
import 'package:rnkr/main.dart';

import '../../global/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: (defaultPadding / 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        // ranking.name,
                        'Ranking',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.edit,
                              size: 30.0,
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(width: (defaultPadding / 2)),
                          GestureDetector(
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 30.0,
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
                          child: ListView(
                            // TODO: Implement list of selected items here
                            children: const [],
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
                          child: ListView(
                            // TODO: Implement list of available items here
                            children: const [],
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
      ),
    );
  }
}
