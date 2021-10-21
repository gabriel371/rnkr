import 'package:flutter/material.dart';
import 'package:rnkr/app/data/models/item_model.dart';
import 'package:rnkr/app/data/models/rank_model.dart';
import 'package:rnkr/app/data/models/ranking_model.dart';
import 'package:rnkr/app/pages/home/widgets/add_item_button.dart';
import 'package:rnkr/app/pages/home/widgets/add_rank_button.dart';
import 'package:rnkr/app/pages/home/widgets/item.dart';
import 'package:rnkr/app/pages/home/widgets/rank.dart';

import '../../global/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Just a temporary example
  RankingModel ranking = RankingModel(
    name: 'New Ranking',
    ranks: [
      RankModel(
        name: 'Rank 1',
        color: const Color(0xFF51EE00),
        position: 0,
        items: [],
      ),
    ],
    items: [
      ItemModel(
        name: 'Item 1',
        repeatable: false,
      ),
    ],
  );

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
                            // TODO: Turn this area into a draggable item target
                            children: [
                              ...ranking.ranks!
                                  .map((rank) => Rank(rank: rank))
                                  .toList(),
                              const AddRankButton(),
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
                          child: ListView(
                            // TODO: Turn these items into draggables
                            children: [
                              ...ranking.items!
                                  .map((item) => Item(item: item))
                                  .toList(),
                              const AddItemButton(),
                            ],
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
