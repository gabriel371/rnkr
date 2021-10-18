import 'category_model.dart';
import 'item_model.dart';
import 'rank_model.dart';

class RankingModel {
  String name;
  CategoryModel category;
  List<ItemModel>? items;
  List<RankModel>? ranks;

  RankingModel({
    required this.name,
    required this.category,
    this.items,
    this.ranks,
  });
}
