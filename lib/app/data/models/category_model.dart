class CategoryModel {
  String name;
  dynamic icon;
  List<dynamic> colors;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.colors,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        icon = json['icon'],
        colors = json['colors'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'colors': colors,
    };
  }
}
