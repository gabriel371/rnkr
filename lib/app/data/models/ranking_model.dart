import 'item_model.dart';
import 'rank_model.dart';

class RankingModel {
  String name;
  List<ItemModel>? items;
  List<RankModel>? ranks;

  RankingModel({
    required this.name,
    this.items,
    this.ranks,
  });
}
