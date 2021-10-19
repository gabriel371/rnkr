import 'package:flutter/material.dart';

import '../../../data/models/ranking_model.dart';
import '../../../global/constants.dart';

class RankingCard extends StatelessWidget {
  final RankingModel ranking;
  const RankingCard({Key? key, required this.ranking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
        horizontal: defaultPadding / 2,
      ),
      child: GestureDetector(
        child: Container(
          width: double.maxFinite,
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                blurRadius: 4.0,
                offset: Offset(0.0, 3.0),
                color: Colors.grey,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: ranking.category!.colors,
                      ),
                      border: const Border(
                        right: BorderSide(
                          width: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        ranking.category!.icon,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 200,
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                        horizontal: defaultPadding / 2,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              onTap: () {
                                print('screenshot ${this.ranking.name}');
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ranking.name.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${ranking.ranks?.length} ranks',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${ranking.items?.length} itens',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          print('Rank ${ranking.name}');
          Navigator.pushNamed(context, '/ranking', arguments: ranking);
        },
      ),
    );
  }
}
