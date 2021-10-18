class ItemModel {
  String name;
  String? photoUrl;
  bool repeatable = false;
  int? repetitions;

  ItemModel({
    required this.name,
    this.photoUrl,
    required this.repeatable,
    this.repetitions,
  });
}