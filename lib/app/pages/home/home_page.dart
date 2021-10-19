import 'package:flutter/material.dart';
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
  dynamic items;

  getItems() async {
    items = await db.collection('rankings').get();
    print(items);
  }

  setItem(Map<String, dynamic> data) async {
    await db.collection('rankings').doc('0').set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: defaultPadding),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    'Rankings',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Center(
                    // Temporary
                    child: TextButton(
                      child: const Text('Check items'),
                      onPressed: () {
                        getItems();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedFontSize: 22.0,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configs',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF00FFF0),
                Color(0xFF009F96),
              ],
            ),
          ),
          child: const Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
        onPressed: () {
          // Temporary
          RankingModel ranking = RankingModel(
            name: 'Brasileirão',
            // TODO: Implement CategoryModel list to use here
            items: [],
            ranks: [],
          );
          setItem(ranking.toJson());
          print('Registered');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
