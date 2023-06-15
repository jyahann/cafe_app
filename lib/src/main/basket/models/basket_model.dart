import 'package:cafe_app/src/main/dishes/models/dish_model.dart';

class BasketModel {
  final DishModel dish;
  final int count;

  BasketModel({
    required this.dish,
    this.count = 1,
  });

  BasketModel copyWith({DishModel? dish, int? count}) {
    return BasketModel(
      dish: dish ?? this.dish,
      count: count ?? this.count,
    );
  }
}
