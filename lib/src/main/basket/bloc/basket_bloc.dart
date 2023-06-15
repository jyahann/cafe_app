import 'package:bloc/bloc.dart';
import 'package:cafe_app/src/main/basket/models/basket_model.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:meta/meta.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(const BasketState()) {
    on<BasketAdd>((event, emit) {
      final newList = state.basketDishes.toList();
      bool isExists = false;
      for (var i = 0; i < newList.length; i++) {
        if (newList[i].dish.id == event.dish.id) {
          newList[i] = newList[i].copyWith(count: newList[i].count + 1);
          isExists = true;
        }
      }
      if (!isExists) {
        newList.add(BasketModel(dish: event.dish));
      }
      emit(state.copyWith(basketDishes: newList));
    });

    on<BasketRemove>(
      (event, emit) {
        final newList = state.basketDishes.toList();
        for (var i = 0; i < newList.length; i++) {
          if (newList[i].dish.id == event.dishId) {
            final count = newList[i].count - 1;
            if (count == 0) {
              newList.removeAt(i);
            } else {
              newList[i] = newList[i].copyWith(count: count);
            }
            break;
          }
        }
        emit(state.copyWith(basketDishes: newList));
      },
    );

    on<BasketPay>((event, emit) => emit(state.copyWith(basketDishes: [])));
  }
}
