class DishModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final int weight;
  final String imageUrl;
  final List<String> tags;

  DishModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    required this.imageUrl,
    required this.tags,
  });
}
