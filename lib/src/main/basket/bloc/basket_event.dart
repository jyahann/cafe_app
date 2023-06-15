part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {
  const BasketEvent();
}

class BasketAdd extends BasketEvent {
  final DishModel dish;

  const BasketAdd({required this.dish});
}

class BasketRemove extends BasketEvent {
  final int dishId;

  const BasketRemove({required this.dishId});
}

class BasketPay extends BasketEvent {
  const BasketPay();
}
