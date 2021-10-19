import 'category_model.dart';
import 'item_model.dart';
import 'rank_model.dart';

class RankingModel {
  String name;
  CategoryModel? category;
  List<ItemModel>? items;
  List<RankModel>? ranks;

  RankingModel({
    required this.name,
    this.category,
    this.items,
    this.ranks,
  });

  RankingModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        items = json['items'],
        ranks = json['ranks'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'items': items,
      'ranks': ranks,
    };
  }
}
