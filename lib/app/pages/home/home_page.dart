import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rnkr/app/data/default_ranking.dart';
import 'package:rnkr/app/pages/home/widgets/clear_content_dialog.dart';

import '../../data/models/item_model.dart';
import '../../data/models/rank_model.dart';
import '../../data/models/ranking_model.dart';
import 'widgets/add_item_modal.dart';
import 'widgets/add_rank_modal.dart';
import 'widgets/item_list.dart';
import 'widgets/rank_list.dart';
import 'widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RankingModel ranking = defaultRanking;

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void _addItem(ItemModel item) => setState(() => ranking.items!.add(item));
  void _addRank(RankModel rank) => setState(() => ranking.ranks!.add(rank));

  void _clearRanks() {
    setState(() => ranking.ranks!.clear());
    Navigator.pop(context);
  }

  void _clearItems() {
    setState(() => ranking.items!.clear());
    Navigator.pop(context);
  }

  void _clearAll() {
    setState(() {
      ranking.ranks!.clear();
      ranking.items!.clear();
    });
    Navigator.pop(context);
  }

  _showAddRankModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (_) {
        return AddRankModal(ranking: ranking, update: _addRank);
      },
    );
  }

  _showAddItemModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (_) {
        return AddItemModal(ranking: ranking, update: _addItem);
      },
    );
  }

  _showClearContentDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return ClearContentDialog(
          ranking: ranking,
          clearItems: _clearItems,
          clearRanks: _clearRanks,
          clearAll: _clearAll,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: TopBar(ranking: ranking),
            ),
            Expanded(
              flex: 20,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 10,
                    child: RankList(ranking: ranking),
                  ),
                  Expanded(
                    flex: 4,
                    child: ItemList(ranking: ranking),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.white,
        icon: Icons.edit,
        overlayOpacity: 0.2,
        openCloseDial: isDialOpen,
        spaceBetweenChildren: 10.0,
        switchLabelPosition: true,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.close,
              color: Theme.of(context).iconTheme.color,
            ),
            label: 'Clear Content',
            labelBackgroundColor: Theme.of(context).errorColor,
            backgroundColor: Theme.of(context).errorColor,
            onTap: () {
              _showClearContentDialog();
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.menu,
              color: Theme.of(context).iconTheme.color,
            ),
            label: 'Add Rank',
            labelBackgroundColor: Theme.of(context).backgroundColor,
            backgroundColor: Theme.of(context).backgroundColor,
            onTap: _showAddRankModal,
          ),
          SpeedDialChild(
            child: Icon(
              Icons.adjust,
              color: Theme.of(context).iconTheme.color,
            ),
            label: 'Add Item',
            labelBackgroundColor: Theme.of(context).backgroundColor,
            backgroundColor: Theme.of(context).backgroundColor,
            onTap: _showAddItemModal,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
