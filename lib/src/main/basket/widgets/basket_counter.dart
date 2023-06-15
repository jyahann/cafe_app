import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:cafe_app/src/main/basket/models/basket_model.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketCounter extends StatelessWidget {
  final DishModel dish;

  const BasketCounter({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: brightBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              BlocProvider.of<BasketBloc>(context).add(
                BasketRemove(dishId: dish.id),
              );
            },
            child: Image.asset("assets/counter_icons/remove.png"),
          ),
          BlocBuilder<BasketBloc, BasketState>(
            builder: (context, state) {
              final basketDish = state.basketDishes
                  .firstWhere((basketDish) => basketDish.dish.id == dish.id);
              return Text(
                basketDish.count.toString(),
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontSize: 14.0),
              );
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              BlocProvider.of<BasketBloc>(context).add(
                BasketAdd(dish: dish),
              );
            },
            child: Image.asset("assets/counter_icons/add.png"),
          ),
        ],
      ),
    );
  }
}
