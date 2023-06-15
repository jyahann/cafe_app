part of 'basket_bloc.dart';

class BasketState {
  final List<BasketModel> basketDishes;

  const BasketState({this.basketDishes = const []});

  BasketState copyWith({List<BasketModel>? basketDishes}) {
    return BasketState(basketDishes: basketDishes ?? this.basketDishes);
  }
}
